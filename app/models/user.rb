class User < ApplicationRecord
  validates :nickname, presence: true
  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'must contain both letters and numbers' }
  validates :name_last, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :name_first, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :name_last_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' }
  validates :name_first_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' }
  validates :birthday, presence: true
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
