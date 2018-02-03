require_dependency "campusero/application_controller"
require 'json'

module Campusero
  class UsersController < ApplicationController
    include HTTParty
    base_uri "https://#{ENV['CPBR_CLIENT_ID']}:#{ENV['CPBR_SECRET_KEY']}@sandboxaccounts.campuse.ro"

    # GET campusero/code?code=:code
    def callback
      code = params[:code]
      if code
        payload = {
          body: {
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": "https://campusero-api.herokuapp.com/campusero/code"
          }
        }
        response = self.class.post("/o/token/",payload)
        Rails.logger.info "********************"
        Rails.logger.info response
        
        redirect_to welcome_index_path({at:response['access_token'],rt: response['refresh_token']})
      end
    end
  
  end
end
