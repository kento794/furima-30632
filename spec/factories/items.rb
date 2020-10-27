FactoryBot.define do
  factory :item do
    name  { '自然' }
    discription { '良い商品です' }
    category_id       { 2 }
    condition_id      { 2 }
    postage_payer_id  { 2 }
    prefecture_id     { 2 }
    handing_time_id   { 2 }
    price             { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
