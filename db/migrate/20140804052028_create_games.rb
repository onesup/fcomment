class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :post, index: true
      t.references :user, index: true
      t.references :page, index: true
      t.string :title
      t.datetime :start_time
      t.datetime :finish_time
      t.string :status, default: 'stop'
      t.string :play_type
      t.integer :players_count

      t.timestamps
    end
  end
end
