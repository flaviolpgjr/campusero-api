require_dependency "campusero/application_controller"

module Campusero
  class WelcomeController < ApplicationController
    def index
      token = params[:at]

      @user = HTTParty.get('https://sandboxapi.campuse.ro/user/myprofile/',
      :options => { :headers => { 'Content-Type' => 'application/json',
                                  'Authorization' => "Bearer #{token}" } })   
     end
  end
end
