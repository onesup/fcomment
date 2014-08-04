class AddPlayerIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :player, index: true
  end
end
