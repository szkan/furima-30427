class ItemsController < ApplicationController
  def index; end
  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :postage_id, :shipment_source_id, :shipment_day_id, :price).merge(user_id: current_user.id)
  end

end
