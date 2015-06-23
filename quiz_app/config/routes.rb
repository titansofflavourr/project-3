Rails.application.routes.draw do


  resources :users, :except =>[:destroy]

  resources :classes, :except =>[:destroy]

  resources :courses

  resources :quizes, :except =>[:destroy]

  resources :questions, :except =>[:destroy]

  resources :choices, :except =>[:destroy]

  resources :responses, :except =>[:destroy]


end
