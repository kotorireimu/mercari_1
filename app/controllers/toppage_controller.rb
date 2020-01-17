class ToppageController < ApplicationController
  def index
    @item = Item.includes(:images).order('created_at DESC')
    @item = Item.last(3)
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
