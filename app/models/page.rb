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
    fields = "name, link, category_list, is_published, can_post, likes, location, phone, checkins, picture, 
      cover, website, description, unread_message_count, unread_notif_count, unseen_message_count, about, 
      description_html, talking_about_count, global_brand_parent_page, access_token, hours"
    page_ids.each do |page_id|
      page_objects << graph.get_object(page_id,{"fields" => fields}) 
    end
    page_objects
  end
  
  def self.building_page_form_fb_hash(hash)
    page = Page.new
    page.name                   = hash["name"] 
    page.link                   = hash["link"]
    page.category_list          = hash["category_list"]
    page.is_published           = hash["is_published"]
    page.can_post               = hash["can_post"]
    page.likes                  = hash["likes"]
    page.location               = hash["location"]
    page.phone                  = hash["phone"]
    page.checkins               = hash["checkins"]
    page.picture                = hash["picture"]
    page.cover                  = hash["cover"]
    page.website                = hash["website"]
    page.description              = hash["description"]
    page.unread_message_count     = hash["unread_message_count"]
    page.unread_notif_count       = hash["unread_notif_count"]
    page.unseen_message_count       = hash["unseen_message_count"]
    page.about                      = hash["about"]
    page.description_html           = hash["description_html"]
    page.talking_about_count        = hash["talking_about_count"]
    page.global_brand_parent_page   = hash["global_brand_parent_page"]
    page.access_token               = hash["access_token"]
    page.hours                      = hash["hours"]
    return page
  end
  
end
