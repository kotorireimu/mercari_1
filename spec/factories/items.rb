FactoryBot.define do
  factory :item do
    name              {"バック"}
    price                 {600}
    text              {"安いよ"}
    condition_id            {1}
    feeburden_id           {1}
    region_id             {1}
    handingtime_id   {1}
    user_id               {1}
    category_id {1}
  end
end
