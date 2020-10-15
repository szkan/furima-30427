class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buy_form = BuyForm.new
    redirect_to root_path if @item.user_id == current_user.id || @item.order.present?
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_form = BuyForm.new(buy_form_params)
    if @buy_form.valid?
      @buy_form.save
      pay_item
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

  def buy_form_params
    params.require(:buy_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_form_params[:token],
      currency: 'jpy'
    )
  end
end
