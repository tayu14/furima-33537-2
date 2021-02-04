class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecure_id, :municipality, :fandee, :bill, :phone_number

  with_options presence: true do
    validates :postal_code
    validates :prefecure_id
    validates :municipality
    validates :fandee
    validates :phone_number
  end

  def save
    Address.create(postal_code: postal_code, prefecure_id: prefecure_id, municipality: municipality, fandee: fandee, bill: bill, phone_number: phone_number)
  end
end