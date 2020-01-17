class User < ApplicationRecord
  has_many :items
  # accepts_nested_attributes_for :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]



  has_one :sns_credential
  has_one :address
  has_many :cards
  has_many :items
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
  
  accepts_nested_attributes_for :address, allow_destroy: true

  validates :birth_day, presence: true
  validates :nickname, presence: true, length: { maximum: 20 } 

  validates :tell, presence: true, uniqueness: true 
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'はカタカナで入力して下さい'}
  validates :family_name, :first_name, presence: true, exclusion: { in: %w(0 1 2 3 4 5 6 7 8 9 # $ % & * + , . : ; = ? ! @ [ ] ^ _ { } - ] + $ ), message: 'に数字や特殊文字は使用できません'}
  
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.find_by(uid: uid, provider: provider)
    if snscredential.present?
      user = User.find_by(id: snscredential.user_id)
    else
      user = User.find_by(email: auth.info.email)
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          tell: "08000000000"
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end
