class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cookies = Cookie.all
    @delivery_options = DeliveryOption.all
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: "Order was successfully created."
    else
      @cookies = Cookie.all
      @delivery_options = DeliveryOption.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :delivery_option_id, :total_price, payment_attributes: [:amount, :status, :payment_method])
  end
end
