Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    authenticated :user do
      root 'contents#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :titles do
    member do
      get 'sort/:position' => :sort
    end
  end
  resources :contents

end
