class OrderAddress
  attr_accessor :token

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecure_id, :municipality, :fandee, :bill, :phone_number, :item_id, :number, :exp_month, :exp_year, :cvc, :user_id

  with_options presence: true do
    validates :postal_code
    validates :prefecure_id
    validates :municipality
    validates :fandee
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}

  validates :phone_number, format: { with: /\A\d{11}\z/ }

  validates :prefecure_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecure_id: prefecure_id, municipality: municipality, fandee: fandee, bill: bill, phone_number: phone_number, order_id: order.id)
  end
end