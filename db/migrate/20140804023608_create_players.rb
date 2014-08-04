class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :pid
      t.string :name
      t.string :fb_link

      t.timestamps
    end
  end
end
