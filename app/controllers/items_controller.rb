class ItemsController < ApplicationController
  def index
    @item = Item.new
    @item.item_images.new
    # @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
    
    # @category = Category.order('id ASC').limit(4)
    # @condition = Condition.order('id ASC').limit(7)
    # @feeburden = Feeburden.order('id ASC').limit(3)
    # @region = Region.order('id ASC').limit(49)
    # @handingtime = Handingtime.order('id ASC').limit(4)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "/items/new"
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
  params.require(:item).permit(:name, :price, :text, item_images_attributes: [:image_url , :_destroy, :id]).merge(user_id: 1, category_id: params[:item][:category], condition_id: params[:item][:condition], feeburden_id: params[:item][:feeburden] , region_id: params[:item][:region], handingtime_id: params[:item][:handingtime])
end
