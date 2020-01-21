class DetailsController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
    @item_image = ItemImage.find(params[:id])

  end
  
end
