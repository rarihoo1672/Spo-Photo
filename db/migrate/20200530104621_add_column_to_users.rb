class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false, unique: true, limit: 12
    add_column :users, :avatar, :string
    add_column :users, :introduction, :string, default: ""
  end
end
