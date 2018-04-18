Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, path: '', path_names: {sign_in:  'login',
                                            sign_out: 'logout',
                                            sign_up:  'register'}

  get 'about-me',  to: 'pages#about'
  get 'contact',   to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :portfolios, except: [:show] do
    patch :sort, on: :collection
  end

  get 'portfolios/:subtitle', to: 'portfolios#list_by_subtitle',
                              as: 'portfolios_subtitle'

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    member do
      post 'toggle_status', to: 'blogs#toggle_status'
    end
  end

  mount ActionCable.server => '/cable'
end
