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


validates :price, presence: true ,numericality: { greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999 , message: '値段は300~9999999以内で、半角数字で入力してください'}
validates :name, presence: true, length: { maximum: 40 } 
validates :text, presence: true, length: { maximum: 1000 } 
validates :condition_id, :feeburden_id, :handingtime_id, :region_id, presence: true, numericality: { greater_than: 0 , message: '選択してください'}

# validates :tell, presence: true, uniqueness: true , format: { with: /\A\d{10,11}[0-9]+\z/, message: 'は半角数字で入力してください'}
# validates :family_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'はカタカナで入力して下さい'}
# validates :family_name, :first_name, presence: true, exclusion: { in: %w(0 1 2 3 4 5 6 7 8 9 # $ % & * + , . : ; = ? ! @ [ ] ^ _ { } - ] + $ ), message: 'に数字や特殊文字は使用できません'}

end
