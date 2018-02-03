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
        response = HTTParty.post("https://JsZVPD3fEmZdE9HElgng3Y6Zxxpwi8kMh6g2OTMO:YXW4gvViztWpnK2XSbcSCI9vnvdMo5vO9FfRsOhexh6xHUaJUPTTzHFKvhDtMDXA85XAuC7TKXuLvyLSCGJ2i0ej8LEfiHZVsUHDaDXtgK89F3i7dMbZAHX8aaaulLs1@sandboxaccounts.campuse.ro/o/token/",payload)
        Rails.logger.info "********************"
        Rails.logger.info response
        
        redirect_to welcome_index_path({at:response['access_token'],rt: response['refresh_token']})
      end
    end
  
  end
end
