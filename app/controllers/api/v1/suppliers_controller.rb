module Api
  module V1
    class SuppliersController < ApplicationController
      before_action :set_supplier, only: %i[show update destroy]
      def index
        supplier = Supplier.all
        render json: supplier, status: :ok
      end

      def create
        supplier = Supplier.new(supplier_params)
        if supplier.save 
          render json: supplier, status: :created
        else
          render json:{errors: supplier.errors.full_messages}, status: :unprocessable_entity
        end
      end

      def show
        render json: @supplier, status: :ok
      end

      def update
        if @supplier.update(supplier_params)
          render json: @supplier, status: :ok
        else
          redner json: {errors: @supplier.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @supplier.destroy
          render status: :no_content
        else
          render json: {error: @supplier.errors.full_messages}, status: :unprocessable_entity
        end
      end

      private
      def set_supplier
        @supplier = Supplier.find(params[:id])
      end

      def supplier_params
        params.require(:supplier).permit(:name, :address, :phone, :email)
      end
    end
  end  
end