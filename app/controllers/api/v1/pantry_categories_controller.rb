class Api::V1::PantryCategoriesController < ApplicationController

    def index
        @pantry_categories = User.find_by(id: params[:user_id]).pantry_categories.uniq
        # byebug
        render json: @pantry_categories 
    end

    def create
        new_category = PantryCategory.new
        new_category.name = params[:name]
        user = User.find_by(id: params[:user_id])
        if new_category.save
            join = UserPantryCategory.new
            join.user = user
            join.pantry_category=new_category
            join.save
            render json: new_category
        else
            render json: {message:"failed to save"}
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
