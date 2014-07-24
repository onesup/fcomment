class ChangeColumnTypeOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :token, :text
  end
end
