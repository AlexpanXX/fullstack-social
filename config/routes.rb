Rails.application.routes.draw do
  devise_for :users

  resources :members do
    resources :invitations
    resources :evaluations
  end

  resources :invitations do
    resources :replies
  end

  resource :personal do
    get :invitations
    get :evaluations
  end

  resources :users

  root "welcome#index"
end
