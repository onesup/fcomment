class Page < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  
  serialize :category_list
  serialize :location
  serialize :picture
  serialize :cover
  serialize :hours
  
  # facebook = Koala::Facebook::API.new(User.first.token)
  # result = facebook.get_connections('467347710027375', 'posts')
  def update_posts_to_raw_data
    results = user.facebook.get_connections(pid, 'posts')
    results.each do |result|
      pid = result['id'].to_i
      post = Post.find_or_initialize_by(pid: pid)
      post.raw_data = result.to_msgpack
      post.save
    end
  end
  
end
