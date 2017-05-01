Rails.application.routes.draw do
  devise_for :users

  resources :members do
    resources :invitations
    resources :evaluations
  end

  resources :invitations do
    resources :replies
  end

  namespace :personal do
    resources :invitations
    resources :evaluations
  end

  resources :users

  root "welcome#index"
end
