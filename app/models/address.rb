class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :prefecure_id
    validates :municipality
    validates :fandee
    validates :phone_number
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}

  validates :phone_number, format: { with: /\A\d{11}\z/ }

  validates :prefecure_id, numericality: { other_than: 1 }

end
