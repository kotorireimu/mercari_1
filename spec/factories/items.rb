FactoryBot.define do 

  factory :item do
    id          {1}
    name        {"test"}
    price       {"¥10000"}
    text        {"テストテストテスト"}
    condition   {"新品、未使用"}
    shipping_id {1}
    saller_id   {1}
    buyer_id    {1}
    category_id {1}
    brand_id    {1}
  end
end
