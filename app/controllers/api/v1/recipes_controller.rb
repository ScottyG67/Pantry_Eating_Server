
class Api::V1::RecipesController < ApplicationController
    skip_before_action :authorized, only: [:searchapi, :index, :destroy]

    def index
        user = User.all.find_by(id: params[:user_id])
        recipes = user.recipes
        render json: recipes
    end

    def show
        byebug
        recipe = Recipe.find_by(id: 1)

    end

    def create
        
        recipe = Recipe.new(recipe_params)

        #the following are hashes with variable keys
        recipe.digest = params[:recipe][:digest]
        recipe.ingredients = params[:recipe][:ingredients]
        recipe.totalDaily = params[:recipe][:totalDaily]
        recipe.totalNutrients = params[:recipe][:totalNutrients]
    
        recipe.user_id = params[:user_id]

        if recipe.save
            render json: recipe
        else
            render json: {error: 'failed to save'}
        end
        
    end

    def destroy
        
        recipe = Recipe.find_by(id: params[:id])
        recipe.destroy
        render json: recipe

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
        params.require(:recipe)
        .permit(
            :calories,
            :image,
            :label,
            :meanType,
            :shareAs,
            :source,
            :totalTime,
            :totalWeight,
            :uri,
            :url,
            :yield,
            :user_id,
            :cautions => [],
            :cuisineType => [],
            :dietLabels => [],
            :dishType => [],
            :healthLabels => [],
            :ingredientLines => []
        )
    end

end
