class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, default: ""
    add_column :users, :avatar, :string
    add_column :users, :introduction, :text, default: ""
  end
end
