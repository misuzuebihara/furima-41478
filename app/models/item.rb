class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :category_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :condition_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :shipping_fee_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :shipping_date_id, numericality: { other_than: 1, message: 'を入力してください' }
end
