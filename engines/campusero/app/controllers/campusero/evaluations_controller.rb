require_dependency "campusero/application_controller"

module Campusero
  class EvaluationsController < ApplicationController
    before_action :set_evaluate, only: [:show, :update, :destroy]

    # GET campusero/evaluations
    def index
      @evaluations = Evaluation.all
      render json: @evaluations
    end

    # POST campusero/evaluations
    def create

      payload = {
        body: {
          score: params[:note]
        }
      }
      headers = {'Authorization': "Bearer #{@params[:token]}"}

      response = HTTParty.post("https://sandboxapi.campuse.ro/agenda/activity/#{params[:slug]}/rate",payload)
      
      render json: response

      #@evaluation = Campusero::Evaluation.create(evaluation_params)
      #if @evaluation.save
      #  render json: @evaluation, status: :created, location: @evaluate
      #else
      #  render json: @evaluation.errors, status: :unprocessable_entity
      #end
    end

    # PATCH/PUT campusero/evaluations/1
    def update
      if @evaluation.update(evaluation_params)
        render json: @evaluation
      else
        render json: @evaluation.errors, status: :unprocessable_entity
      end
    end

    # DELETE campusero/evaluations/1
    def destroy
      @evaluation.destroy
    end

    # GET campusero/evaluations/1
    def show
      render json: @evaluation
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_evaluation
        @evaluation = Evaluation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def evaluation_params
        params.require(:evaluation).permit(:slug, :note, :username)
      end
  
  end
end
