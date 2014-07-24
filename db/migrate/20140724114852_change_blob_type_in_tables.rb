class ChangeBlobTypeInTables < ActiveRecord::Migration
  def change
    change_column :posts, :raw_data, :binary
    change_column :comments, :raw_data, :binary
  end
end
