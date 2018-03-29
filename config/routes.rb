Rails.application.routes.draw do
  root 'pages#home'

  get 'about-me', to: 'pages#about'
  get 'contact',  to: 'pages#contact'

  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    member do
      post 'toggle_status', to: 'blogs#toggle_status'
    end
  end
end
