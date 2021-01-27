class Item < ApplicationRecord
    belongs_to :user
    has_one    :order
    has_one_attached :image

  with_options presence: true do
    validates :goods_name
    validates :goods_explanation
    validates :price
    validates :image
    end
    with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :prefecure_money_id
    validates :prefecure_id
    validates :scheduled_delivery_id
    validates :status_id
  end
    validates :price,  format: { with: /\A[0-9]+\z/ }

    validates :price,
    numericality: { only_integer: true,
    greater_than: 299, less_than: 10000000
    }

    extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecure_money
  belongs_to :prefecure
  belongs_to :scheduled_delivery
  belongs_to :status
end
