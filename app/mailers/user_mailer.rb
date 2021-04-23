class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end

    def delete_account_email(email)
        
        mail(to: email, subject: 'Your Account Has Been Deleted')
    end
end

