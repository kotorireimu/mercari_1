class ItemsController < ApplicationController
  def index
    @item = Item.new
    @item.item_images.new
  end

  def new
    @item = Item.new
    @item.item_images.new

  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

 # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children

  end


  def create
    @item = Item.new(item_params)
  
    if @item.save
      redirect_to root_path
    else
      render "/items/new"
    end
  end

  def show
    
    @item = Item.find(1)
  end

  def edit
    # @item = Item.find(params[:id])
    # gon.item = @item
    # gon.item_images = @item.item_images
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    else
      render "homes/exhibition"
    end
  end
end

private

def item_params
  params.require(:item).permit(:name, :price, :text, item_images_attributes: [:image_url , :_destroy, :id]).merge(user_id: current_user.id, category_id: params[:item][:category], condition_id: params[:item][:condition], feeburden_id: params[:item][:feeburden] , region_id: params[:item][:region], handingtime_id: params[:item][:handingtime])
end
