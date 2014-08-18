class Game < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :page
  
  attr_accessor :fetch_status
  
  def toggle_status
    if status == 'stop'
      self.status = 'run'
    elsif status == 'run'
      self.status = 'stop'
    end
    save    
  end
  
  def fetch_comments
    self.update(fetch_status: 'fetching')
    post.fetch_comments
    self.update(fetch_status: 'stop')
  end
  
end
