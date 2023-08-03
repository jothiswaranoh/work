# app/mailers/notification_mailer.rb
class NotificationMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'This is only for testing')
    end
    # def welcome_email
    #     @user = params[:user]
    #     @url  = user_url(@user)
    #     delivery_options = { user_name: params[:company].smtp_user,
    #                          password: params[:company].smtp_password,
    #                          address: params[:company].smtp_host }
    #     mail(to: @user.email,
    #          subject: "Please see the Terms and Conditions attached",
    #          delivery_method_options: delivery_options)
    #   end
  end
  