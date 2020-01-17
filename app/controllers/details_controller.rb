class DetailsController < ApplicationController
  
  def index
    @item = Item.find(params[:id])
    @item_image = ItemImage.all
    @user = User.find(current_user.id)
  end
  
end
