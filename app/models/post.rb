class Post < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
  has_many :comments
  
  def fetch_comments
    results = user.facebook.get_connections(data['id'], 'comments', limit: 100, filter: 'stream')
    
    begin
      results.each do |result|
        cid = result['id']
        comment = Comment.where(cid: cid).first_or_create
        comment.user = user
        comment.post = self
        comment.cid = cid
        comment.raw_data = result.to_msgpack
        comment.message = result["message"]
        player = Player.find_or_initialize_by(pid: result["from"]["id"])
        player.name = result["from"]["name"]
        player.save
        comment.player = player
        comment.save
        

      end
      results = results.next_page
    end while results != nil

  end
  
  def data
    @data ||= MessagePack.unpack raw_data
  end
end
