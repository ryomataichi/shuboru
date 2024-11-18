class ShizensController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        if params[:search] != nil && params[:search] != ''
            search = params[:search]
            @shizens = Shizen.joins(:user).where("ken LIKE ? OR spot_name LIKE ?", "%#{search}%", "%#{search}%")
        elsif params[:new].present?
            @shizens = Shizen.sort_new
        elsif params[:old].present?
            @shizens = Shizen.sort_old      
        elsif params[:good].present?
            @shizens = Shizen.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
        else
            @shizens = Shizen.all
        end
    end
    

    def new
        @shizen = Shizen.new
    end
    
    def create
        shizen = Shizen.new(shizen_params)
        shizen.user_id=current_user.id
        if shizen.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def edit
        @shizen = Shizen.find(params[:id])
    end

    def show
        @shizen = Shizen.find(params[:id])
        @comments = @shizen.comments
        @comment = Comment.new
        @user = User.find_by(params[:id]) 
    end

    def destroy
        shizen = Shizen.find(params[:id])
        shizen.destroy
        redirect_to action: :index
    end
    
    def update
        shizen = Shizen.find(params[:id])
        if shizen.update(shizen_params)
        redirect_to :action => "show", :id => shizen.id
        else
        redirect_to :action => "new"
        end
    end
    
    private
    def shizen_params
        params.require(:shizen).permit(:image, :yokogazou, :tategazou2, :yokogazou2, :spot_name, :ken, :maplink, :setumei)
    end
end
