class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cookies = Cookie.all
    @delivery_options = DeliveryOption.all
    @box_options = OrderItem::BOXES
  end

  def create
    puts "=== ORDER PARAMS DEBUG ==="
    puts params.inspect
    puts "=== ORDER PARAMS DEBUG ==="
    
    @order = Order.new(order_params)
    
    puts "=== ORDER OBJECT DEBUG ==="
    puts "Order valid: #{@order.valid?}"
    puts "Order errors: #{@order.errors.full_messages}"
    puts "Order items count: #{@order.order_items.count}"
    @order.order_items.each_with_index do |item, index|
      puts "Order item #{index}: box_size=#{item.box_size}, box_price=#{item.box_price}"
      puts "Box cookies count: #{item.box_cookies.count}"
      item.box_cookies.each_with_index do |bc, bc_index|
        puts "  Box cookie #{bc_index}: cookie_id=#{bc.cookie_id}, quantity=#{bc.quantity}"
      end
    end
    puts "=== ORDER OBJECT DEBUG ==="
    
    if @order.save
      redirect_to @order, notice: "Order was successfully created."
    else
      @cookies = Cookie.all
      @delivery_options = DeliveryOption.all
      @box_options = OrderItem::BOXES
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(
      :user_id, 
      :delivery_option_id, 
      :total_price,
      order_items_attributes: [
        :id,
        :box_size, 
        :box_price,
        :_destroy,
        box_cookies_attributes: [
          :id,
          :cookie_id, 
          :quantity,
          :_destroy
        ]
      ],
      payment_attributes: [
        :amount, 
        :status, 
        :payment_method
      ]
    )
  end
end
