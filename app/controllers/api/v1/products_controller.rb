module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[ show update destroy]

      def index
        product = Product.all
        render json: product
      end

      def create
        product = Product.new(product_params)
        if product.save 
          render json: product, status: :created
        else
          render json: {errors: product.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: @product
      end

      def update
        if @product.update(product_params) 
          render json: @product, status: :ok
        else
          render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
        end
      end

      def destroy
        if @product.destroy
          render status: :no_content
        else
          render json: {error: @product.errors.full_messages}, status: :unprocessable_entity
        end
      end

      private
      def product_params
        params.require(:product).permit(:name, :description, :price, :min_quantity, :current_quantity, :category_id, :supplier_id)
      end

      def set_product
        @product = Product.find(params[:id])
      end
    end
  end
end