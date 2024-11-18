class CreateShizens < ActiveRecord::Migration[6.1]
  def change
    create_table :shizens do |t|
      t.string :spot_name
      t.text :setumei
      t.string :ken
      t.string :maplink
      t.timestamps
    end
  end
end
