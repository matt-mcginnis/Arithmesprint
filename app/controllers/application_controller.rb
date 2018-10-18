class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :location, :bio, :friends, :avatar, :pending_friend_requests, :pending_friend_invitations])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :location, :bio, :friends, :avatar, :pending_friend_requests, :pending_friend_invitations])
    end
end
