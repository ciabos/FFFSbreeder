module Api
  module V1
    class BaseController < ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken
      include Roar::Rails::ControllerAdditions

      respond_to :json

      before_action :configure_permitted_parameters, if: :devise_controller?
      before_action :authenticate_breeder!

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_in) << :session
      end
    end
  end
end
