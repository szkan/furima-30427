class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipment_day
  belongs_to_active_hash :shipment_source

  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :postage_id, presence: true, numericality: { other_than: 1 }
  validates :shipment_source_id, presence: true, numericality: { other_than: 1 }
  validates :shipment_day_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  belongs_to :user
  has_one_attached :image
end
