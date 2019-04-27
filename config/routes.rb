Rails.application.routes.draw do
  resources :dados
  get '/data/:inicio/:fim', to: 'dados#data'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
