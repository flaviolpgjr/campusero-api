require_dependency "campusero/application_controller"

module Campusero
  class EvaluationsController < ApplicationController
    before_action :set_evaluate, only: [:update, :destroy]

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
        },
        headers: {'Authorization': "Bearer #{params[:token]}"}
      }

      response = HTTParty.post("https://sandboxapi.campuse.ro/agenda/activity/#{params[:slug]}/rate",payload)

      if response.success?
        @evaluation = Campusero::Evaluation.create(evaluation_params)
        if @evaluation.save
          res = {
            evaluations: Campusero::Evaluation.where(slug: params[:slug]).count,
            average: Campusero::Evaluation.where(slug: params[:slug]).average(:note),
            sum: Campusero::Evaluation.where(slug: params[:slug]).sum(:note)
          }
          render json: res , status: :created, location: @evaluate
        else
          render json: @evaluation.errors, status: :unprocessable_entity
        end
      else
        render json: response
      end
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
      if params[:id].nil?
        render json: {error: 'Informe o slug'}
      else
        response = {
          evaluations: Campusero::Evaluation.where(slug: params[:id]).count,
          average: Campusero::Evaluation.where(slug: params[:id]).average(:note),
          sum: Campusero::Evaluation.where(slug: params[:id]).sum(:note)
        }
        render json: res , status: :created, location: @evaluate
      end
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
