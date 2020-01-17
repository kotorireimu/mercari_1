class DetailsController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @item_image = ItemImage.find(params[:item_id])
    @user = User.find(params[:user_id])
  end
  

end
