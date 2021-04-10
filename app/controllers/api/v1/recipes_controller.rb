
class Api::V1::RecipesController < ApplicationController
    skip_before_action :authorized, only: [:searchapi, :create]

    def index
        recipes = Recipe.all
        render json: recipes
    end

    def show
        byebug
        recipe = Recipe.find_by(id: 1)

    end

    def create
        
        recipe = Recipe.new(recipe_params)
        
        # recipe.calories = params[:recipe][:calories]
        # recipe.cautions = params[:recipe][:cautions]
        # recipe.cuisineType = params[:recipe][:cuisineType]
        # recipe.dietLabels = params[:recipe][:dietLabels]
        # recipe.digest = params[:recipe][:digest]
        # recipe.dishType = params[:recipe][:dishType]
        # recipe.healthLabels = params[:recipe][:healthLabels]
        # recipe.image = params[:recipe][:image]
        # recipe.ingredientLines = params[:recipe][:ingredientLines]
        # recipe.ingredients = params[:recipe][:ingredients]
        # recipe.label = params[:recipe][:label]
        # recipe.meanType = params[:recipe][:meanType]
        # recipe.shareAs = params[:recipe][:shareAs]
        # recipe.source = params[:recipe][:source]
        # recipe.totalDaily = params[:recipe][:totalDaily]
        # recipe.totalNutrients = params[:recipe][:totalNutrients]
        # recipe.totalTime = params[:recipe][:totalTime]
        # recipe.totalWeight = params[:recipe][:totalWeight]
        # recipe.uri = params[:recipe][:uri]
        # recipe.url = params[:recipe][:url]
        # recipe.yield = params[:recipe][:yield]

        recipe.user_id = params[:user_id]

        # byebug
        if recipe.save
            render json: recipe
        else
            render json: {error: 'failed to save'}
        end
        
    end

    def destroy
        byebug
        recipe = Recipe.find_by(id: 1)
    end
     
    def searchapi 
        resp = RestClient.get "https://api.edamam.com/search?q=#{params['searchText']}&app_id=9db917fd&app_key=c621a1acced53c09facd07f43ef85b0d"
        render json: resp
    end


    private

    def search_params
        params.require(:recipe).permit(:searchText)
    end

    def recipe_params
        params.require(:recipe).permit(:calories,:cautions,:cuisineType,:dietLabels,:digest,:dishType,:healthLabels,:image,:ingredientLines,:ingredients,:label,:meanType,:shareAs,:source,:totalDaily,:totalNutrients,:totalTime,:totalWeight,:uri,:url,:yield,:user_id)
    end

end
