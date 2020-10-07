class Item < ApplicationRecord
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :shipment_source_id, presence: true
  validates :shipment_day_id, presence: true
  validates :price, presence: true, format: { with: /\d[300-9999999]/ }

  belongs_to :user
end
