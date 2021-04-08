class Api::V1::PantryCategoriesController < ApplicationController

    def index
        categories = PantryCategory.all
        render json: categories
    end

    def create
        byebug
        new_category = PantryCategory.new
        new_category.name = params["name"]
        if new_category.save
            render json: new_category
        else
            render json: {"failed to save"}
        end
    end

    def destroy
        category = PantryCategory.find_by(id: params['id'])
        category.destroy
        render json: category
    end
    
end
