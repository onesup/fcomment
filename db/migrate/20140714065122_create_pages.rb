class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :user, index: true
      t.string :name
      t.string :link
      t.text :category_list
      t.string :is_published
      t.string :can_post
      t.integer :likes
      t.string :location
      t.string :phone
      t.string :checkins
      t.text :picture
      t.string :cover
      t.string :website
      t.text :description
      t.integer :unread_message_count
      t.integer :unread_notif_count
      t.integer :unseen_message_count
      t.string :about
      t.text :description_html
      t.integer :talking_about_count
      t.string :global_brand_parent_page
      t.string :access_token
      t.text :hours

      t.timestamps
    end
  end
end
