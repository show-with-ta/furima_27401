class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = PurchaseOrder.new
  end

  def create
    @order = PurchaseOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
 
  private
 
  def order_params
    params.permit(:post_code, :prefecture_id, :city, :street_number, :building, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end
 
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_9d48c8ea6858bc9cfd7d87bc"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
