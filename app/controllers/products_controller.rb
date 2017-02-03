class ProductsController < ApplicationController
  include ActionController::Serialization

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find_by(sku: params[:id])
    render json: @product
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :ok
    else
      render json: { error: @product.errors.messages }, status: 400
    end
  end

  def destroy
    @product = Product.find_by(sku: params[:id])
    if @product.destroy
      render json: {  message: "product is gone forever and never."}, status: :ok
    else
      render json: {  message: "Product could not be destroyed"}, status: 400
    end
  end

  private

  def product_params
    params.permit(:name,
                  :sku,
                  :recycle_rate,
                  :logistics_rate,
                  :org_id,
                  :image
                 )
  end

end
