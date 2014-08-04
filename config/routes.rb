Rails.application.routes.draw do
  namespace :mypage do
    resources :games
    resources :posts do
      resources :comments do
        collection do
          get :update_from_fb
        end
      end
    end
    resources :pages do
      resources :posts do
        collection do
          get :update_from_fb
        end
      end
      collection do
        get :update_from_fb
      end
    end
  end

  get 'landings/index'

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords", omniauth_callbacks: "users/omniauth_callbacks"}, skip: [:sessions, :registrations]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landings#index'
  
  #->Prelang (user_login:devise/stylized_paths)
  devise_scope :user do
    get    "login"   => "devise/sessions#new",         as: :new_user_session
    post   "login"   => "devise/sessions#create",      as: :user_session
    delete "signout" => "devise/sessions#destroy",     as: :destroy_user_session
    
    get    "signup"  => "devise/registrations#new",    as: :new_user_registration
    post   "signup"  => "devise/registrations#create", as: :user_registration
    put    "signup"  => "devise/registrations#update", as: :update_user_registration
    get    "account" => "devise/registrations#edit",   as: :edit_user_registration
  end

end
