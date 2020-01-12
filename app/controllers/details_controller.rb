class DetailsController < ApplicationController
  
  def index
    @item = Item.find(1)
    @item_image = ItemImage.all
    @user = User.find(1)
  end
end
