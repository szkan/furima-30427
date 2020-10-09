FactoryBot.define do
  factory :item do
    name { '広瀬すず' }
    text { 'モデル、女優' }
    category_id { '2' }
    condition_id { '2' }
    postage_id {'2'}
    shipment_source_id {'2'}
    shipment_day_id {'2'}
    price {'300'}
    association :user
  end
end
