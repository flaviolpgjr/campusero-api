require_dependency "campusero/application_controller"

module Campusero
  class MuralsController < ApplicationController
    before_action :set_mural, only: [:show, :edit, :update, :destroy]

    # GET campusero/murals
    def index
      @murals = Mural.all
      render json: @murals
    end

    # GET campusero/murals/1
    def show
      render json: @mural
    end

    # POST campusero/murals
    def create
      @mural = Campusero::Mural.new(mural_params)

      if @mural.save
        render json: @mural, status: :created, location: @mural
      else
        render json: @mural.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT campusero/murals/1
    def update
      if @mural.update(mural_params)
        render json: @mural
      else
        render json: @mural.errors, status: :unprocessable_entity
      end
    end

    # DELETE campusero/murals/1
    def destroy
      @mural.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_mural
        @mural = Mural.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def mural_params
        params.require(:mural).permit(:username, :description)
      end
  end
end
