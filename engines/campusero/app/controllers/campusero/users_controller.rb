require_dependency "campusero/application_controller"

module Campusero
  class UsersController < ApplicationController

    # GET campusero/code?code=:code
    def callback
      code = params[:code]
      if code
        puts code
      else
        puts 'no_code'
      end
    end
  
  end
end
