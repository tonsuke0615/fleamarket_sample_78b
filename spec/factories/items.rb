FactoryBot.define do
  
  factory :item do
    name               {"テスト商品"}
    detail             {"テスト説明"}
    category_id        {"133"}
    shippingFee_id     {"1"}
    condition_id       {"1"}
    shippingFrom_id    {"1"}
    preparationDay_id  {"1"}
    user_id            {"1"}
    price              {"1000"}
  end


end
