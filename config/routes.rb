Rails.application.routes.draw do
  root 'pages#main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/subscriptions/create', to: 'subscriptions#create'
  post '/subscriptions/send', to: 'subscriptions#send_test'
  get '/admin', to: 'pages#admin'
end
