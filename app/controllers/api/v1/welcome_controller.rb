module Api
  module V1
    class WelcomeController < ApplicationController
      def index
        render json: { message: "hello world" }, status: 200
      end
    end
  end
end
