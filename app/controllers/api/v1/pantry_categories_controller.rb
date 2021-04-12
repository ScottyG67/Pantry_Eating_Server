class Api::V1::PantryCategoriesController < ApplicationController

    def index
        byebug
        categories = PantryCategory.all
        render json: categories include: :pantry_items
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
        #do not allow user to delete "None" Category
        if category.name = "None"
            render json: {message: "cannot delete 'None' category"}
        end
        # Reassign PantryItems in category to "None" Category
        items_list = category.pantry_items
        if items_list.length > 0 
            none_category = PantryCategory.find_by(name: "None")
            items_list.each do |item| 
                item.pantry_category = none_category
                item.save
            end
        end

        category.destroy
        render json: category
    end
    
end
