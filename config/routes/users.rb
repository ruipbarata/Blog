devise_for :users

namespace :users do
  resources :articles do
    resources :comments do
      resources :reply_comments
    end
  end

  get "/", to: "users#index", as: "root_path"
  get "/edit_profile/:id", to: "users#edit_profile", as: "edit_profile"
end
