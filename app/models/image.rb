class Image < ApplicationRecord
  belongs_to :hotel
  has_many :values
  has_many :users, through: :values

  def average_rating
    values.average(:value)&.round(2) || 0
  end

  mount_uploader :file, ImageUploader
  validates :name, presence: true
end
