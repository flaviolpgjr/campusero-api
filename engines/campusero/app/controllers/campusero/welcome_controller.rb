require_dependency "campusero/application_controller"

module Campusero
  class WelcomeController < ApplicationController
    def index
      redirect_to and return if root_path if params[:at].blank? 

      @token = params[:at]
      @refresh_token = params[:rt]
      response = HTTParty.get('https://sandboxapi.campuse.ro/user/myprofile/')
      
      
      headers= {'Authorization': "Bearer #{@token}"}
      
      @user = HTTParty.get('https://sandboxapi.campuse.ro/user/myprofile/', headers: headers)
      Rails.logger.info @user
     end
  end
end
