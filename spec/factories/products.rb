FactoryBot.define do
  factory :product do
    quantity { 1 }
    product { 123456 }
    unit_price { 100 }
    amount { 100 }
  end
end
