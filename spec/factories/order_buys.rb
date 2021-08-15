FactoryBot.define do
  factory :order_buy do
    token { "tok_abcdefjk00000001234567890" }
    postal_code { "123-4567" }
    prefecture_id { 15 }
    city { "横山市緑区" }
    address { "青山1-1-1" }
    building { "柳ビル103" }
    telephone { "09012345678" } 
  end
end
