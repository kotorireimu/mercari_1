class DetailsController < ApplicationController
  
  def index
    @item = Item.find(params[:format])
    @item_image = @item.item_images
    @user = User.find(current_user.id)
  end
  
end
