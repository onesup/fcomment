class Post < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
  has_many :comments
  
  def fetch_comments
    results = user.facebook.get_connections(data['id'], 'comments', limit: 100, filter: 'stream')
    begin
      results.each do |result|
        cid = result['id']
        begin
          Comment.transaction do
            comment = Comment.where(cid: cid).lock(true).first_or_create
            comment.user = user
            comment.post = self
            comment.cid = cid
            comment.raw_data = result.to_msgpack
            comment.message = result["message"]
            player = Player.find_or_initialize_by(pid: result["from"]["id"])
            player.name = result["from"]["name"]
            player.save
            comment.player = player
            comment.created_at = result["created_time"]
            comment.save!
          end
        rescue Mysql2::Error
          puts "@@@@@.d.e.a.d.l.o.c.k.@@@@@"
        end
      end
      results = results.next_page
    end while results != nil
  end
  
  def game_result
    
  end
  
  def comments_base_analytics
    comments = self.comments
    player_count = comments.pluck(:player_id).uniq.count
    
    result = {player_count: player_count}
  end
  
  def data
    @data ||= MessagePack.unpack raw_data
  end
end
