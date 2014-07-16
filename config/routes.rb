ResidenceGoldwyn::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users
  root :to => "stays#new"
  get '/:locale' => "stays#new", :locale => /en|fr/

  scope "(:locale)", :locale => /en|fr/ do
    devise_for :admin_users, ActiveAdmin::Devise.config   

    resources :stays, :only => [:index, :new, :create, :edit]
    resources :rooms, :only => [:index,:show]
    resources :agencies, :only => [:new, :create]

    get "stays/waiting_for_transfer" => "stays#waiting_for_transfer"
    get 'agencies/sign_in' => "agencies#sign_in"
    post 'agencies/connect' => "agencies#connect"
    get 'agencies/summary' => "agencies#summary"
    get 'agencies/confirmation' => "agencies#confirmation"

    get 'payment' => "pages#payment", :as => 'payment'
    get 'before_payment' => "pages#before_payment", :as => "before_payment"
    get 'cgv' => "pages#cgv", :as => "cgv"
    get 'pro' => "pages#pro", :as => "pro"
    get 'summary' => "pages#summary", :as => "summary"
    get 'payment_cancel' => "pages#payment_cancel", :as => "payment_cancel"
    get 'payment_warning' => "pages#payment_warning", :as => "payment_warning"
    get 'payment_error' => "pages#payment_error", :as => "payment_error"
    get 'confirmation' => "pages#confirmation", :as => "confirmation"
    get 'virement' => "pages#virement", :as => "virement"

  end

end