Rails.application.routes.draw do
  devise_for :users

  resources :learning_posts do
    collection do
      get :my_posts
    end
  end
  get "home/index"
  get "up" => "rails/health#show", as: :rails_health_check
  mount ActionCable.server => "/cable"
  root "learning_posts#index"
end
