class Api::V1::PantryItemsController < ApplicationController

    def index 
        @pantry_items = User.find_by(id: params[:user_id]).pantry_items
        render json: @pantry_items 
    end


    def searchapi
        # byebug
        resp = RestClient.get "https://api.edamam.com/api/food-database/v2/parser?app_id=#{Rails.application.credentials.EDAMAM_APP_ID}&app_key=#{Rails.application.credentials.EDAMAM_KEY}&#{params[:searchType]}=#{params[:search]}"
        convert_api(resp)
        # byebug
        # item.name = resp[:food][:label]
        # item.ext_id = resp[:food][:foodId]
        # item.image = resp[:food][:image]
        # item.foodContentsLabel=resp[:food][:foodContentsLabel]

        # render json: item
    end

    def create
        #default assign to "none" category
        if params[:category_id]
            cat = PantryCategory.find_by(id: params[:category_id])
        else
            cat = PantryCategory.find_by(name: "None")
        end
        #see if already exists
        item = PantryItem.find_or_initialize_by(ext_id: params[:pantry_item][:ext_id], user_id:[:user_id])
        
        item.name = params[:pantry_item][:name]
        item.ext_id = params[:pantry_item][:ext_id]
        item.image = params[:pantry_item][:image]
        item.foodContentsLabel=params[:pantry_item][:foodContentsLabel]
        item.pantry_category = cat
        item.user_id=params[:user_id]

        if item.save
            render json: item
        else
            
            render json: {error: "there was an error"}
        end
    end

    def destroy
        
        item = PantryItem.find_by(id: params[:id])
        item.destroy
        render json: item

    end

    def update
        item = PantryItem.find_by(id: params[:pantry_item][:id])
        
        item.pantry_category_id = params[:pantry_item][:pantry_category_id]
        if item.save
            render json: item
        else
            render json: {error: "There was an error"}
        end
    end


    private

    def convert_api (resp)
        # byebug
        resp_obj = JSON.parse(resp)

        converted_resp = resp_obj['hints'].map do |item|
            {'name' => item['food']['label'],
            'ext_id' => item['food']['foodId'],
            'image' => item['food']['image'],
            'foodContentsLabel'=>item['food']['foodContentsLabel']}
        end
        
        render json:  converted_resp

    end


end
