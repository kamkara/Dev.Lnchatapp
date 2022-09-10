Rails.application.routes.draw do
  resources :citytowns
  resources :schools
  resources :materials
  resources :levels
  
  #Membership
  get "teacher-sign-up" , to:'membership#teacherUp'
  get "teacher-sign-in" , to:'membership#teacherIn'
  get "ambassadeur-sign-up" , to:'membership#ambassadorUp'
  get "ambassadeur-sign-in" , to:'membership#ambassadorIn'
  get "team-sign-up" , to:'membership#teamUp'
  get "team-sign-in" , to:'membership#teamIn'

  #Dashboard
  get "dashboard", to:'dashboard#index'
  get "setting", to:'dashboard#home'

  #Membership 
  devise_scope :user do
    get '/student-sign-in', to: 'devise/sessions#new'
    get '/student-sign-up', to: 'devise/registrations#new', as: "new_user_registration"
    delete '/sign-out', to: 'devise/sessions#destroy'
  end
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepage#index"
end
