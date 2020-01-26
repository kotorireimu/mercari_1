class Address < ApplicationRecord
  belongs_to :user

  validates :post_number, presence: true, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/, message: "の値が不正です"}
  validates :prefecture,:city,:address_line, presence: true
  
end
