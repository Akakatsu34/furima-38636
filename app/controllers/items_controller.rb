class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show]
  before_action :correct_item, only: :edit
  before_action :sold_out_item, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :describe,
      :category_id,
      :condition_id,
      :shipping_charge_id,
      :ship_from_id,
      :delivery_duration_id,
      :price,
      :image
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end

  def correct_item
    @item = Item.find(params[:id])
    return if @item.user.id == current_user.id

    redirect_to action: :index
  end

  def sold_out_item
    @item = Item.find(params[:id])
    if @item.order.present?
      redirect_to action: :index
    end
  end
end
