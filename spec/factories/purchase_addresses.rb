FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    phone_number { '19012345678' }
    token {'4242424242424242'}
    association :user
    association :item
  end
end
