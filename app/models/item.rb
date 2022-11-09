class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :ship_from
  belongs_to :delivery_duration
  has_one_attached :image


  validates :name,                 presence: true
  validates :describe,             presence: true
  validates :category_id,          presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_from_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_duration_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                presence: true
  validates :user,                 presence: true
end
