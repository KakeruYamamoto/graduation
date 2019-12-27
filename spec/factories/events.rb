FactoryBot.define do
  factory :event do
    title { "MyString" }
    content { "MyText" }
    image { "MyString" }
    o_id { 1 }
    # e_date { "2019-12-25 00:03:25" }
    e_date_start
    e_date_end
    address
  end
end
