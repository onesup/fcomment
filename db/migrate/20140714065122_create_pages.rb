class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :user, index: true
      t.string :pid, index: true
      t.string :name
      t.string :username
      t.string :link
      t.string :is_published
      t.string :can_post
      t.string :location
      t.string :phone
      t.string :website
      t.string :about
      t.string :global_brand_parent_page
      t.string :access_token
      t.integer :talking_about_count
      t.integer :unread_message_count
      t.integer :unread_notif_count
      t.integer :unseen_message_count
      t.integer :were_here_count
      t.integer :likes
      t.integer :checkins
      t.text :cover
      t.text :category_list
      t.text :picture
      t.text :description
      t.text :description_html
      t.text :hours
      

      t.timestamps
    end
  end
end
