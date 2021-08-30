Rails.application.routes.draw do
  resources :nurseries, only: [:show], param: :code do
    post "search", on: :collection
    resources :capacities, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
