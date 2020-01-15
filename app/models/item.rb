class Item < ApplicationRecord
  belongs_to :user , optional: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :category , optional: true
  belongs_to :condition , optional: true
  belongs_to :feeburden , optional: true
  belongs_to :handingtime , optional: true
  belongs_to :region , optional: true
  # belongs_to :brand

  # has_many :comments, dependent: :destroy
  # has_many :messages, dependent: :destroy
  # has_many :likes, dependent: :destroy

  has_many :item_images, dependent: :destroy
  # has_many :reviews
  # has_one :shipping
  # has_one :order

  accepts_nested_attributes_for :item_images, allow_destroy: true


validates :price, presence: true ,numericality: { greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999 , message: '値段は300~9999999以内で、半角数字で入力してください'}
validates :name, presence: true, length: { maximum: 40 } 
validates :text, presence: true, length: { maximum: 1000 } 
validates :category_id , :condition_id, :feeburden_id, :handingtime_id, :region_id, presence: true, numericality: { greater_than: 0 , message: '選択してください'}


end
