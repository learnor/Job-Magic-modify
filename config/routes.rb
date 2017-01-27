Rails.application.routes.draw do
  get 'profiles/edit'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :jobs
  resources :jobs do
    resources :resumes
  end

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
      resources :resumes
    end
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
