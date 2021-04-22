Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :destroy] do
        resources :pantry_items
        resources :recipes
        resources :pantry_categories
        post '/item_search', to: 'pantry_items#searchapi'
      end
      
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/recipes_search', to: 'recipes#searchapi'
    end
  end

  

end 
