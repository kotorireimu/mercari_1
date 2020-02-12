class DetailsController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
    @item_image = ItemImage.find_by(item_id: @item.id)
    if @item.user_id == current_user.id
      redirect_to item_path(@item)
    else
      render :show
    end
  end
  
end
