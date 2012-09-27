ResidenceGoldwyn::Application.routes.draw do

  ActiveAdmin.routes(self)


  root :to => "stays#new"
  match '/:locale' => "stays#new", :locale => /en|fr/

  scope "(:locale)", :locale => /en|fr/ do
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
    get 'payment_cancel' => "pages#payment_cancel", :as => "payment_cancel"
    get 'payment_warning' => "pages#payment_warning", :as => "payment_warning"
    get 'payment_error' => "pages#payment_error", :as => "payment_error"
    get 'confirmation' => "pages#confirmation", :as => "confirmation"
    devise_for :admin_users, ActiveAdmin::Devise.config   
    devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions" }
  end

end