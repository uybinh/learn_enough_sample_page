Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  root "static_page#home"
  get "/help", to: 'static_page#help'
  get "/about", to: 'static_page#about'
  get "/contact", to: 'static_page#contact'
end
