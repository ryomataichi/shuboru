class AddyokogazouToShizens < ActiveRecord::Migration[6.1]
  def change
    add_column :shizens, :yokogazou, :string
  end
end
