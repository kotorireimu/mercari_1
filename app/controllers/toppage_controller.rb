class ToppageController < ApplicationController
  def index
    @item = Item.all
    @ledys = @item.where(category_id: 2..201).order(created_at: :desc)
    @mens = @item.where(category_id: 201..347).order(created_at: :desc)
    @appliances = @item.where(category_id: 899..985).order(created_at: :desc)
    @hobby = @item.where(category_id: 686..799).order(created_at: :desc)
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
