Rails.application.routes.draw do



  resources :award_options
  resources :nomination_types

  root to: 'landing#index'
  devise_for :users
  resources :users

  # You can have the root of your site routed with "root"
  #root to: 'dashboards#dashboard_1'

  get 'packards/confirmation', to: "packards#confirmation"
  get 'shoulds/confirmation', to: "shoulds#confirmation"
  get 'developments/confirmation', to: "developments#confirmation"
  get 'achievements/confirmation', to: "achievements#confirmation"
  get 'product_supports/confirmation', to: "product_supports#confirmation"
  get 'logistics/confirmation', to: "logistics#confirmation"

  get 'nominations/list', to: "nominations#list"
  resources :nominations
  resources :packards  #, controller: 'nominations', type: 'Packard'
  resources :shoulds
  resources :developments
  resources :achievements
  resources :product_supports
  resources :logistics

  #get 'sites/:name', :to => 'sites#show', :as => site
  #devise_for :members do get '/members/sign_out' => 'devise/sessions#destroy' end

  devise_scope :user do
     delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "landing/version"
  get "landing/index"
  get "landing/nomination"

  get "*any", via: :all, to: "errors#not_found"

end
