class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name, null: false, limit: 25
      t.string :main_visual, null: false
      t.string :infomation
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
