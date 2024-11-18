class AddTategazou2ToShizens < ActiveRecord::Migration[6.1]
  def change
    add_column :shizens, :tategazou2, :string
  end
end
