class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :nick_name
         validates :first_name
         validates :family_name
         validates :first_name_kana
         validates :family_name_kana
         validates :birthday
         end

         validates :password, format: { with: /\A[a-z0-9]+\z/ }

          has_many :items
          has_many :orders

end
