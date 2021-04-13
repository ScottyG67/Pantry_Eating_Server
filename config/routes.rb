Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        resources :pantry_items
        resources :recipes
        post '/item_search', to: 'pantry_items#searchapi'
      end
      resources :pantry_categories
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/recipes_search', to: 'recipes#searchapi'
    end
  end

  

end 
