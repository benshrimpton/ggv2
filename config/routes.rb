Rails.application.routes.draw do


  root to: 'pages#home'
  get '/home', to: 'pages#home'
  get '/store', to: 'store_locations#index'

  resources :homepageimages
  resources :pages, only: :index
  resource :google_product_feeds, only: :show

  get '/subscribe', to: 'pages#index'
  get '/gift-card', to: 'pages#gift_card'
  get '/mailer_tester', to: 'mailer#show'

  get '/journal', to: 'posts#index'
  get '/journal/:url_key', to: 'posts#show'
  get '/search' => 'gemgento/search#index'
  # - Category - #
  get 'shop/:parent_url_key/:url_key',  to: 'gemgento/categories#show', as: 'shop_by_parent_and_key'
  get 'shop/:url_key',                  to: 'gemgento/categories#show', as: 'shop_by_key'
  get 'shop',                           to: 'gemgento/categories#index'

  # combined login / sign up controller / user routes
  get 'login', to: 'registration_session#new', as: 'new_login'
  post 'login', to: 'registration_session#create', as: 'login'
  get '/user/sign_in', to: redirect("/user/login", status: 302)

  get 'collections', to: 'collections#index'
  get 'collections/:url_key', to: 'collections#show'
  get 'collections/:url_key/video', to: 'collections#video'

  get 'partials/minibag', to: 'pages#mini_bag'

  # EMAIL PREVIEWS
  get 'email/subscriber', to: 'email#subscriber'
  get 'email/order', to: 'email#order'
  get 'email/credit_memo', to: 'email#credit_memo'
  get 'email/shipment', to: 'email#shipment'
  get 'email/invoice', to: 'email#invoice'
  get 'email/reset', to: 'email#reset'
  get 'email/welcome', to: 'email#welcome'
  get 'thankyou', to: 'pages#order_thank_you'

  # Wishlist
  get '/user/wishlist', to: 'gemgento/user/wishlist_items#index'
  get '/user/wishlist/:product_id', to: 'wishlist_items#create'
  post '/user/wishlist/:product_id', to: 'wishlist_items#create'

  # New Admin panel
  get 'skynet', to: 'skynet#index'
  get 'skynet/products', to: 'skynet#products'
  get 'skynet/settings', to: 'skynet#settings'
  get 'skynet/lookbooks', to: 'skynet#lookbooks'
  get 'skynet/lookbook/:id', to: 'skynet#lookbook'
  get 'skynet/lookbook/:id/gallery', to: 'skynet#gallery'
  get 'skynet/stores', to: 'skynet#stores'
  get 'skynet/categories', to: 'skynet#categories'
  get 'skynet/category/:id', to: 'skynet#category'
  get 'skynet/product/:id', to: 'skynet#product'
  get 'skynet/settings', to: 'skynet#settings'
  get 'skynet/pages', to: 'skynet#pages'
  get 'skynet/page/:id', to: 'skynet#page'

  # Gift Cards
  namespace :user do
    resources :gift_cards, only: [:index, :create]
  end

  # errors
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unacceptable'
  get '/500', to: 'errors#internal_error'

  resources :email_leads, only: :create
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Gemgento::Engine, at: '/'

  get '/:url_key', to: 'pages#show'
end
