class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :player
  
  def data
    @data ||= MessagePack.unpack raw_data
  end
    
end
