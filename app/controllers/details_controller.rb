class DetailsController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
    @item_image = ItemImage.find(params[:id])
    # @user = User.find(params[:user_id])
  end
  

end
