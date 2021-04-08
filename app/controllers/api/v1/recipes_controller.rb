require 'uri'
require 'net/http'
require 'openssl'

class Api::V1::RecipesController < ApplicationController

    def index
        resp = RestClient.get 'https://api.edamam.com/search?q=chicken&app_id=9db917fd&app_key=c621a1acced53c09facd07f43ef85b0d'
        render json: resp
    end
end
