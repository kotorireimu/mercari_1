class ItemsController < ApplicationController
  before_action :set_array ,only: [:edit,:update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
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
   
    @item_image = ItemImage.find(params[:id])
  end

  def edit
  
    @item_image = ItemImage.find(params[:id])
    

    # itemに紐づいていいる孫カテゴリーの親である子カテゴリが属している子カテゴリーの一覧を配列で取得
    @category_child_array = @item.category.parent.parent.children

    # itemに紐づいていいる孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
    @category_grandchild_array = @item.category.parent.children
  end

  def update
    
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  
    if @item.destroy
      redirect_to root_path
    else
      render "homes/exhibition"
    end
  end
end

private

def item_params
  params.require(:item).permit(:name, :price, :text, item_images_attributes: [:image_url , :_destroy, :id]).merge(user_id: current_user.id, category_id: params[:category_id], condition_id: params[:item][:condition], feeburden_id: params[:item][:feeburden] , region_id: params[:item][:region], handingtime_id: params[:item][:handingtime])
end


def set_array
  @category_parent_array = []
  # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
  Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
  end
end

def set_item
  @item = Item.find(params[:id])
end