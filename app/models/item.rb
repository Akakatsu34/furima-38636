class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :order
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :ship_from
  belongs_to :delivery_duration
  has_one_attached :image

  validates :image, presence: true
  validates :name,                 presence: true, length: { maximum: 40   }
  validates :describe,             presence: true, length: { maximum: 1000 }
  validates :category_id,          presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :condition_id,         presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_charge_id,   presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :ship_from_id,         presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :delivery_duration_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :price,                presence: true
  validates :price, numericality: { only_integer: true, message: 'は半角の数字を入力してください' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300円以上 9,999,999円以下を入力してください' }
  
end
