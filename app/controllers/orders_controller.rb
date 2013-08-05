class OrdersController < ApplicationController
  def create
    @order = Order.new params[:order]

    if @order.save
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end
end