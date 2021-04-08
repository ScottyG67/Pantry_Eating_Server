class Api::V1::RecipesController < ApplicationController

    def index
        byebug
        render json: {message: "here"}
    end
end
