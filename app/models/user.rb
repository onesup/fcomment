class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  devise authentication_keys: [:login]  
  has_many :pages
  attr_accessor :login
  
  #->Prelang (user_login/devise)
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    # The User was found in our database
    return user if user

    # The User was not found and we need to create them
    User.create(
      name:     auth.extra.raw_info.name,
      provider: auth.provider,
      uid:      auth.uid,
      token:    auth.extension.token,
      email:    auth.info.email,
      password: Devise.friendly_token[0,20]
    )
  end  
  
  #->Prelang (user_login:devise/username_login_support)
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.downcase}]).first
    else
      where(conditions).first
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
  end
  
  def update_pages
    fetch_page_list.each do |page|
      self.pages << building_page_form_fb_hash(page)
    end
    save
  end
    
  def fetch_page_list
    pages = facebook.get_connection('me', 'accounts')
    page_ids = Array.new
    pages.each{|page| page_ids << page["id"]}
    page_objects = Array.new
    fields = "name, link, category_list, is_published, can_post, likes, location, 
      phone, checkins, picture, cover, website, description, unread_message_count, 
      unread_notif_count, unseen_message_count, about, description_html, 
      talking_about_count, global_brand_parent_page, access_token, hours, 
      were_here_count, username"
    page_objects = facebook.batch do |batch_api|  
      page_ids.each do |page_id|
        batch_api.get_object(page_id,{"fields" => fields}) 
      end
    end
    page_objects
  end
  
  def building_page_form_fb_hash(hash)
    pid = hash['id']
    hash.delete 'id'
    page = Page.find_or_initialize_by(pid: pid)
    page.pid = pid
    page.update_attributes(hash)
    page
  end
end
