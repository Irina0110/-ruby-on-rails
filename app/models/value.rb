class Value < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :image, optional: true

  validates :value, inclusion: { in: 1..5 }
  validates :user_id, uniqueness: { scope: :hotel_id, message: "уже оценивал этот отель" }
end
