class AddUserIdToShizens < ActiveRecord::Migration[6.1]
  def change
    add_column :shizens, :user_id, :integer
  end
end
