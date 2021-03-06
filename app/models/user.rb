class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :birthday
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は漢字、全角ひらがな、全角カタカナで入力してください' }
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい' }
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i, message: 'は半角英数字混同で入力してください' }

  has_many :products
  has_many :orders
end
