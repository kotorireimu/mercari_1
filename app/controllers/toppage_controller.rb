class ToppageController < ApplicationController
  def index
    @item = Item.includes(:item_images).last(5)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
