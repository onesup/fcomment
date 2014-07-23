class Page < ActiveRecord::Base
  belongs_to :user
  serialize :category_list
  serialize :location
  serialize :picture
  serialize :cover
  serialize :hours
  
end
