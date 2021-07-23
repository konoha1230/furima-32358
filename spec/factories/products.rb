FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    price { rand(300..9_999_999) }
    category_id { rand(2..11) }
    status_id { rand(2..7) }
    delivery_charge_id { rand(2..3) }
    prefecture_id { rand(2..48) }
    duration_id { rand(2..4) }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/mobile-battery.JPG'), filename: 'mobile-battery.JPG')
    end
  end
end
