FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birth_year            {1997}
    birth_month           {9}
    birth_day             {23}
    family_name           {"中山"}
    first_name            {"友作"}
    family_name_kana      {"ナカヤマ"}
    first_name_kana       {"ユウサク"}
    tell                  {"08012345677"}
  end

end