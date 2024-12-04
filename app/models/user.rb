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

FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'abc123' }
    password_confirmation { 'abc123' }
    name_last            { '山田' }
    name_first           { '太郎' }
    name_last_kana       { 'ヤマダ' }
    name_first_kana      { 'タロウ' }
    birthday             { '1930-01-01' }
  end
end