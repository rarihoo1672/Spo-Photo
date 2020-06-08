class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :cotent, null: false, limit: 30
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true
      t.timestamps
    end
  end
end
