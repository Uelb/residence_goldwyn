ResidenceGoldwyn::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config   
  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions" }
  root :to => "stays#new"

  resources :stays, :only => [:index, :new, :create, :edit]
  resources :rooms, :only => [:index,:show]
  resources :agencies, :only => [:new, :create]

  match 'agencies/sign_in' => "agencies#sign_in", :via => :get
  match 'agencies/connect' => "agencies#connect", :via => :post
  match 'agencies/summary' => "agencies#summary", :via => :get
  match 'agencies/confirmation' => "agencies#confirmation", :via => :get

  get 'payment' => "pages#payment", :as => 'payment'
  get 'before_payment' => "pages#before_payment", :as => "before_payment"
  get 'cgv' => "pages#cgv", :as => "cgv"
  get 'pro' => "pages#pro", :as => "pro"
  get 'summary' => "pages#summary", :as => "summary"

end