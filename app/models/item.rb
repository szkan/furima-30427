class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipment_day
  belongs_to_active_hash :shipment_source

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :postage_id, numericality: { other_than: 1 }
    validates :shipment_source_id, numericality: { other_than: 1 }
    validates :shipment_day_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  belongs_to :user
  has_one_attached :image
  has_one :order
end
