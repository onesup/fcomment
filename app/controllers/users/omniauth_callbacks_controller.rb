class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ApplicationHelper

  def facebook

    # Attempt to find the User
    auth = request.env["omniauth.auth"]
    auth.merge!(extend_fb_token(auth.credentials.token))
    @user = User.find_for_facebook_oauth(auth, current_user)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication # This will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      #session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  
  def extend_fb_token(token)
    # can be called once a day to extend fb access token
    # if called twice or more in one day, will return the same token

    # require "net/https"
    # require "uri"

    uri = URI.parse(
    "https://graph.facebook.com/oauth/access_token?client_id=" + Rails.application.secrets.fb_app_id.to_s + 
    "&client_secret=" + Rails.application.secrets.fb_app_secret + 
    "&grant_type=fb_exchange_token&fb_exchange_token=" + token )
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    matched_response = /access_token=(.+)&expires=(.+)/.match(response.body)
    parsed_response = Hash["extension", Hash["token", matched_response[1], "expiry", matched_response[2]]]
    return parsed_response
  end
  
end
