class User < ApplicationRecord
  has_many :items
  # accepts_nested_attributes_for :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :birth_year, :birth_month, :birth_day, presence: true
  validates :nickname, presence: true, length: { maximum: 20 } 
  validates :tell, presence: true, uniqueness: true , format: { with: /\A\d{10,11}[0-9]+\z/, message: 'は半角数字で入力してください'}
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'はカタカナで入力して下さい'}
  validates :family_name, :first_name, presence: true, exclusion: { in: %w(0 1 2 3 4 5 6 7 8 9 # $ % & * + , . : ; = ? ! @ [ ] ^ _ { } - ] + $ ), message: 'に数字や特殊文字は使用できません'}
  
end
