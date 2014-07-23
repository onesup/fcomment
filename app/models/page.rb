class Page < ActiveRecord::Base
  belongs_to :user
  serialize :category_list
  serialize :location
  serialize :picture
  serialize :cover
  serialize :hours
  
  def self.update_pages(user)
    graph = Koala::Facebook::API.new(user.token)
    pages = Page.fetch_page_list(graph)
    pages.each do |page|
      user.pages << self.building_page_form_fb_hash(page)
    end
    user.save
  end
    
  def self.fetch_page_list(graph)
    pages = graph.get_connection('me', 'accounts')
    page_ids = Array.new
    pages.each{|page| page_ids << page["id"]}
    page_objects = Array.new
    fields = "name, link, category_list, is_published, can_post, likes, location, 
      phone, checkins, picture, cover, website, description, unread_message_count, 
      unread_notif_count, unseen_message_count, about, description_html, 
      talking_about_count, global_brand_parent_page, access_token, hours, 
      were_here_count, username"
    page_ids.each do |page_id|
      page_objects << graph.get_object(page_id,{"fields" => fields}) 
    end
    page_objects
  end
  
  def fetch_posts
    graph = Koala::Facebook::API.new(User.last)
    posts = graph.get_connection(Page.last.pid, 'feeds')
  end
  
  def self.building_page_form_fb_hash(hash)
    pid = hash['id']
    hash.delete 'id'
    page = Page.find_or_initialize_by(pid: pid)
    page.pid = pid
    page.update_attributes(hash)
    page
  end
  
end
