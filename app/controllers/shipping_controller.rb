class ShippingController < ApplicationController
  def index
    @shipping = Shipping.includes(:images).order('created_at DESC')
  end

  
end
