class ImagesController < ApplicationController
  def show_image
    @item = Item.find(params[:id])
    @image = @item.item_images.find_by(params[:id])
    send_data @image.image_url, :type => 'image/svg', :disposition => 'inline'
  end
end
