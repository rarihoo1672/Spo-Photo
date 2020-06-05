class CreatePeripheries < ActiveRecord::Migration[5.2]
  def change
    create_table :peripheries do |t|
      t.string :sub_visual
      t.references :spot, foreign_key: true
      t.timestamps
    end
  end
end
