class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :prefecure_id
    validates :municipality
    validates :fandee
    validates :phone_number
  end
end
