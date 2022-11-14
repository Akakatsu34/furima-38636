class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_item, only: :index
  before_action :seller_cannot_buy, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if 
      @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id],user_id: current_user.id)
  end

  def seller_cannot_buy
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def sold_out_item
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
  end
end
