FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code     {"984-2443"}
    prefecure_id    {3}
    municipality    {"広島市安佐南区"}
    fandee          {"12-4-2"}
    phone_number    {98282737473}
    
  end
end
