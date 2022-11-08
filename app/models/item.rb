class Item < ApplicationRecord
  validates :name,                 presence: true
  validates :describe,             presence: true
  validates :category_id,          presence: true
  validates :condition_id,         presence: true
  validates :shipping_charge_id,   presence: true
  validates :ship_from_id,         presence: true
  validates :delivery_duration_id, presence: true
  validates :price,                presence: true
  validates :user,                 presence: true
end
