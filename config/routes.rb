Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      # resources :sidebar_items, only: [:index]
      get 'sidebar_items', controller: :sidebar_items, action: :index
    end
  end
  root to: 'home#index', defaults: { format: 'json' }
end
