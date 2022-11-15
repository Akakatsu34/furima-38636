class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: :index
  before_action :seller_cannot_buy, only: :index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :price).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def seller_cannot_buy
    return unless current_user == @item.user

    redirect_to root_path
  end

  def sold_out_item
    return unless @item.order.present?

    redirect_to root_path
  end
end
