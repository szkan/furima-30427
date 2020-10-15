FactoryBot.define do
  factory :buy_form do
    token { 'tok_abcdefghijk00000000000000000'}
    post_code {'123-4567'}
    prefecture_id {2}
    city {'ああ'}
    address {1}
    building_name {'ABCビル'}
    phone_number {1_234_567_890}
  end
end
