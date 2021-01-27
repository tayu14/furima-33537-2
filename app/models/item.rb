class Item < ApplicationRecord
    belongs_to :user, optional: true
    has_one    :order
    has_one_attached :image

  with_options presence: true do
    validates :goods_name
    validates :goods_explanation
    validates :price
    end

    validates :category_id, numericality: { other_than: 1 }
    validates :prefecure_money_id, numericality: { other_than: 1 }
    validates :prefecure_id, numericality: { other_than: 1 }
    validates :scheduled_delivery_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }

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
