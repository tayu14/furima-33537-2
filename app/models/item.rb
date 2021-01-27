class Item < ApplicationRecord
  with_options presence: true do
    validates :goods_name
    validates :goods_explanation
    validates :category_id
    validates :status_id
    validates :prefecure_id
    validates :prefecure_money_id
    validates :scheduled_delivery_id
    validates :price
    validates :user
    end

    belongs_to :user
    has_one    :order
    has_one_attached :image

    validates :category_id, numericality: { other_than: 1 }
    validates :prefecure_money_id, numericality: { other_than: 1 }
    validates :prefecure_id, numericality: { other_than: 1 }
    validates :scheduled_delivery_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }

    extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecure_money
  belongs_to :prefecure
  belongs_to :scheduled_delivery
  belongs_to :status
end
