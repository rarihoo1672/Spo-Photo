class RenameColumnInfomationToInformation < ActiveRecord::Migration[5.2]
  def change
    rename_column :spots, :infomation, :information
  end
end
