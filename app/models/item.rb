class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :ship_from
  belongs_to :delivery_duration
  has_one_attached :image

  validates :name,                 presence: true, length: { maximum: 40   }
  validates :describe,             presence: true, length: { maximum: 1000 }
  validates :category_id,          presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,         presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id,   presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_from_id,         presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_duration_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                presence: true
  validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :image, presence: true
end
