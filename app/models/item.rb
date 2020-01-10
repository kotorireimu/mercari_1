class Item < ApplicationRecord
  belongs_to :user , optional: true
  belongs_to :category , optional: true
  belongs_to :condition , optional: true
  belongs_to :feeburden , optional: true
  belongs_to :handingtime , optional: true
  belongs_to :region , optional: true
  # belongs_to :brand
  # has_many :comments dependent: :destroy
  # has_many :messages dependent: :destroy
  # has_many :likes dependent: :destroy
  has_many :item_images, dependent: :destroy
  # has_many :reviews
  # has_one :shipping
  # has_one :order

  accepts_nested_attributes_for :item_images, allow_destroy: true

end
