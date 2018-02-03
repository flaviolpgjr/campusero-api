require_dependency "campusero/application_controller"

module Campusero
  class WelcomeController < ApplicationController
    def index
      token = params[:at]
      response = HTTParty.get('https://sandboxapi.campuse.ro/user/myprofile/')
      
      
     headers= {'Authorization': "Bearer #{token}"}
     
      @user = HTTParty.get('https://sandboxapi.campuse.ro/user/myprofile/', headers: headers)
      Rails.logger.info @user
     end
  end
end
