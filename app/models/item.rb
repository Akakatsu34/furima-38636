class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :ship_from
  belongs_to :delivery_duration
  has_one_attached :image

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, inclusion: { in: 300..9_999_999 }
  end

  validates :name,                 presence: true, length: { maximum: 40   }
  validates :describe,             presence: true, length: { maximum: 1000 }
  validates :category_id,          presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_from_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_duration_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image,      presence: true
end
