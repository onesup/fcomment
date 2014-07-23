class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :pid
      t.text :message
      t.text :raw_data
      t.references :page, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
