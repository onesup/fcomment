class Game < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :page
  
  def toggle_status
    if status == 'stop'
      self.status = 'run'
    elsif status == 'run'
      self.status = 'stop'
    end
    save    
  end
end
