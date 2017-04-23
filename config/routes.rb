Rails.application.routes.draw do
  devise_for :users

  resources :members do
    resources :invitations
    resources :evaluations
  end

  resources :invitations
  resources :evaluations
  resources :users

  root "welcome#index"
end
