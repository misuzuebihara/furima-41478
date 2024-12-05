class User < ApplicationRecord
  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :name_last, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :name_first, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :name_last_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' }
  validates :name_first_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' }
  validates :birthday, presence: true
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

