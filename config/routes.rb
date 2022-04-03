Rails.application.routes.draw do
  root "todo_lists#index"
  devise_for :users
  resources :todo_lists do
    resources :todo_items do
      member do
        put :done
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
