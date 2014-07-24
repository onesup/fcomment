class ChangeColumnTypeOfPages < ActiveRecord::Migration
  def change
    change_column :pages, :access_token, :text
  end
end
