class Page < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  has_many :posts
  
  serialize :category_list
  serialize :location
  serialize :picture
  serialize :cover
  serialize :hours
  
  # facebook = Koala::Facebook::API.new(User.first.token)
  # result = facebook.get_connections('467347710027375', 'posts')
  def fetch_posts
    results = user.facebook.get_connections(pid, 'posts')
    results.each do |result|
      pid = result['id']
      post = Post.find_or_initialize_by(pid: pid)
      post.user = user
      post.raw_data = result.to_msgpack
      post.page = self
      post.save
    end
  end
  
  def data
    @data ||= MessagePack.unpack raw_data
  end
  
end
