class ProductsController < ApplicationController
  def create
    if customer.products.create(products_params)
      redirect_to customer_path(customer)
    else
      render :new
    end
  end

  private

  def products_params
    params.permit(products: [:quantity, :product, :unit_price, :amount]).require(:products)
  end

  def customer
    @customer ||= Customer.find params[:customer_id]
  end
end
