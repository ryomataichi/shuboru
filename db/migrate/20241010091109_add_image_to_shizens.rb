class AddImageToShizens < ActiveRecord::Migration[6.1]
  def change
    add_column :shizens, :image, :string
  end
end
