Rails.application.routes.draw do

  
  #resources :flash_cards
  resources :user_echanges, except: [:create, :new]
  resources :flashes, except: [:create, :index, :new]
  
  
  #Course items
  resources :courses, shallow: true do
    resources :flashes, only: [:create, :index, :new]
    resources :user_echanges, only: [:create, :new]
  end
  #resources :flash_cards, except:[:index, :show] do
    # resources :line_items, except: [:index, :show]
  #end

  resources :courses
  resources :citytowns
  resources :schools
  resources :materials
  resources :levels

  #Courses
  get "courses-show", to:"courses#show"
  get "feed", to:"courses#index"
  get "lesson", to:"courses#new"

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
  get "new-materials", to:"materials#new"
  get "new-levels", to:"levels#new"
  get "new-city", to:"citytowns#new"
  get "new-school", to:"schools#new"

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
