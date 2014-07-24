class ChangeColumnTypeOfComments < ActiveRecord::Migration
  def change
    change_column :posts, :pid, :string
    change_column :comments, :cid, :string
  end
end
