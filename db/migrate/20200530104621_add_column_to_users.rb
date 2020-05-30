class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :avatar, :string
    add_column :users, :introduction, :string
  end
end
