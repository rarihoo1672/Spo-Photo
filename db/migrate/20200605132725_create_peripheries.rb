class CreatePeripheries < ActiveRecord::Migration[5.2]
  def change
    create_table :peripheries do |t|

      t.timestamps
    end
  end
end
