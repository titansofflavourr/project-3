Rails.application.routes.draw do

  devise_for :users

  root 'dashboards#index' 

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :sessions, only: [:new, :create, :destroy]

  get '/report', to: 'dashboards#report'

  resources :dashboards

  post '/users/:id/invite', to: 'users#send_invite'
  
  get '/users/report', to: 'users#report'
  post '/enroll_user/:id', to: 'users#enroll'

  resources :users, :except =>[:destroy]

  resources :courses

  get '/cohorts/report', to: 'cohorts#report'

  resources :cohorts, :except =>[:destroy] do
    resources :quizzes, :except =>[:destroy]
  end

  post '/enroll_cohort/:id', to: 'cohorts#enroll'

  # resources :cohorts, :except =>[:destroy]

  get '/quiz', to: 'quizzes#take'

  get '/quizzes/report', to: 'quizzes#report'

  post '/copyquiz/:id', to: 'quizzes#copy'

  resources :assessments, only: [:index]

  resources :quizzes, :except =>[:destroy] do
    resources :assessments, :except =>[:destroy]
  end

  resources :questions, :except =>[:destroy]

  resources :choices, :except =>[:destroy]

  resources :responses, :except =>[:destroy]

  # devise_for :users, :controllers => { :invitations => 'users/invitations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


end
