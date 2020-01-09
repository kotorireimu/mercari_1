class ItemsController < ApplicationController
  def index
    # @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private

def item_params
  params.require(:item).permit(:name, :price, :text, :condition , item_images_attributes: [:image_url]).merge(user_id: 1)
end
