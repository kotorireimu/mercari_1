class DetailsController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
    @item_image = ItemImage.find_by(item_id: @item.id )

  end
  
end
