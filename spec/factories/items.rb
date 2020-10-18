FactoryBot.define do
  
  factory :item do
    name               {"テスト商品"}
    detail             {"テスト説明"}
    category_id        {create(:category).id}
    shippingFee_id     {"1"}
    condition_id       {"1"}
    shippingFrom_id    {"1"}
    preparationDay_id  {"1"}
    user_id            {"1"}
    price              {"1000"}

    after(:build) do |item|
      item.item_images << build(:item_image)
    end

  end

  factory :item_image do
    item_id {"1"}
    src { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image.jpeg"), 'image/jpeg') }# MIME
    # photo { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image.jpeg"), 'image/png') } 
  end

  factory :category do
    name      {"腕時計(デジタル)"}
    id        {"174"}
    ancestry  {"1/27"}
  end

end
