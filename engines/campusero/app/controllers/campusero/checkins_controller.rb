require_dependency "campusero/application_controller"

module Campusero
  class CheckinsController < ApplicationController
    before_action :set_checkin, only: [:show, :update, :destroy]

    # GET campusero/checkins
    def index
      @checkins = Checkin.all
      render json: @checkins
    end

    # POST campusero/checkins
    def create
      @checkin = Campusero::Checkin.create(checkin_params)
      if @checkin.save
        render json: @checkin, status: :created, location: @checkin
      else
        render json: @checkin.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT campusero/checkins/1
    def update
      if @checkin.update(checkin_params)
        render json: @checkin
      else
        render json: @checkin.errors, status: :unprocessable_entity
      end
    end

    # DELETE campusero/checkins/1
    def destroy
      @checkin.destroy
    end

    # GET campusero/checkins/1
    def show
      render json: @checkin
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def checkin_params
      params.require(:checkin).permit(:slug, :username)
    end
  end
end
