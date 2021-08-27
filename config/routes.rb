Rails.application.routes.draw do
  resources :nurseries, only: [:show] do
    post "search", on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
