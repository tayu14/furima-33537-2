FactoryBot.define do
  factory :address do
    postal_code     {"984-2443"}
    prefecure_id    {3}
    municipality    {"広島市安佐南区"}
    fandee          {"12-4-2"}
    phone_number    {98282737473}
    association :order
  end
end
