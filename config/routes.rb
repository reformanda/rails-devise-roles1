Rails.application.routes.draw do


  resources :score_types
  #, :conditions => { :method => :get }
  match "/documents/:model/:folder/:id/:basename.:extension" => "redocuments#download", via: :get

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

  get 'nominations/update_awards', as: 'update_awards'
  get 'nominations/list', to: "nominations#list"
  get 'boards/list', to: "boards#list"
  get 'asps/confirmation', to: "asps#confirmation"
  get 'battalions/confirmation', to: "battalions#confirmation"
  get 'bops/confirmation', to: "bops#confirmation"
  get 'brigades/confirmation', to: "brigades#confirmation"
  get 'cps/confirmation', to: "cps#confirmation"
  get 'decps/confirmation', to: "decps#confirmation"
  get 'esis/confirmation', to: "esis#confirmation"
  get 'loys/confirmation', to: "loys#confirmation"
  get 'ncos/confirmation', to: "ncos#confirmation"
  get 'pmpdo05s/confirmation', to: "pmpdo05s#confirmation"
  get 'pmpdo06s/confirmation', to: "pmpdo06s#confirmation"
  get 'pmpdp05s/confirmation', to: "pmpdp05s#confirmation"
  get 'pmpdp06s/confirmation', to: "pmpdp06s#confirmation"
  get 'stps/confirmation', to: "stps#confirmation"

  get 'scores/score_print', to: "scores#score_print"
  get 'scores/reports', to: "scores#reports"
  get 'scores/:id/score_report', to: "scores#score_report"

  resources :nominations
  resources :packards  #, controller: 'nominations', type: 'Packard'
  resources :shoulds
  resources :developments
  resources :achievements
  resources :product_supports
  resources :logistics
  resources :boards
  resources :scores
  resources :asps
  resources :battalions
  resources :bops
  resources :brigades
  resources :cps
  resources :decps
  resources :esis
  resources :loys
  resources :ncos
  resources :pmpdo05s
  resources :pmpdo06s
  resources :pmpdp05s
  resources :pmpdp06s
  resources :stps

  resources :score_types

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
