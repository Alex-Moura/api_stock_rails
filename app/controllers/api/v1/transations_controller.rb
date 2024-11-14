module Api
  module V1
    class TransationsController < ApplicationController
      before_action :set_transation, only: %i[show update destroy]

      def index
        transations = Transation.all
        render json: transations 
      end

      def create
        transation = Transation.new(transation_params)
        if transation.save 
          render json: transation, status: :created
        else
          render json: {errors: transation.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: @transation
      end

      def update
        if @transation.update(transation_params) 
          render json: @transation, status: :ok
        else
          render json: {error: @transation.errors.full_messages}, status: :unprocessable_entity
        end
      end

      def destroy
        if @transation.destroy 
          render status: :no_content
        else
          render json: {error: @transation.errors.full_messages}, status: :unprocessable_entity
        end
      end

      private

      def transation_params
        params.require(:transation).permit(:quantity, :type_transation, :product_id)
      end

      def set_transation
        @transation = Transation.find(params[:id])
      end
    end
  end
end