class ApplicationController < ActionController::API

    before_action :authorized

    def encode_token(payload)
        byebug
        JWT.encode(payload, Rails.application.credentials.AUTH_SECRET_KEY)      # NEED TO CHANGE BEFORE PRODUCTION!!!!!!!!!
        # JWT.encode(payload, ENV['AUTH_SECRET_KEY'])
    end
    
    def auth_header
        #looking for 'Authorization': 'Bearer <token>' in headers: {...}
        request.headers['Authorization']
    end
    
    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token,Rails.application.credentials.AUTH_SECRET_KEY, true, algorithm: 'HS256')[0] # NEED TO CHANGE BEFORE PRODUCTION!!!!!!!!!
                # JWT.decode(token, ENV['AUTH_SECRET_KEY'], true, algorithm: 'HS256')[0]
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token['user_id']
            @user = User.find_by(id: user_id)
        end
    end
    
    def logged_in?
        !!current_user
    end

    def authorized
        
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end
