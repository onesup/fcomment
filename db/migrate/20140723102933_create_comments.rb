class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :cid
      t.text :message
      t.text :raw_data
      t.references :post, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
