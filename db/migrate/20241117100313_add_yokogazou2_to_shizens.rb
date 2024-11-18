class AddYokogazou2ToShizens < ActiveRecord::Migration[6.1]
  def change
    add_column :shizens, :yokogazou2, :string
  end
end
