module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[show update destroy]
      def index
        categories = Category.all
        render json: categories
      end

      def create
        category = Category.new(category_params)
        if category.save 
          render json: category, status: :created
        else
          render json: {errors: category.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: @category, status: :ok
      end

      def update
        if @category.update(category_params)
          render json: @category, status: :ok
        else
          render json: {errors: @category.errors.full_messages}, status: :unprocessable_entity 
        end
      end

      def destroy
        if @category.destroy
          render status: :no_content
        else
          render json: {error: @category.errors.full_messages}, status: :unprocessable_entity
        end
      end

      


      private

      def category_params
        params.require(:category).permit(:name, :description)
      end

      def set_category
        @category = Category.find(params[:id])
      end
    end
  end
end