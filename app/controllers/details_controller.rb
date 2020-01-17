class DetailsController < ApplicationController
  
  def index
    @item = Item.find_by(params[:item_id])
    @item_image = ItemImage.find_by(params[:item_id])
    @user = User.find(params[:user_id])
  end
  

end
