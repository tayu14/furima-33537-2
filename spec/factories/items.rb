FactoryBot.define do
  factory :item do
    goods_name             {"イラストや"}
    goods_explanation            {"フリー素材"}
    category_id           {2}
    status_id       {2}
    prefecure_money_id      {2}
    prefecure_id              {2}
    scheduled_delivery_id                 {2}
    price              {500}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
