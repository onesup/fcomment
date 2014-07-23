class AddRawDataToPages < ActiveRecord::Migration
  def change
    add_column :pages, :raw_data, :text
  end
end
