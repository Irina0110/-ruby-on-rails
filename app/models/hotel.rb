class Hotel < ApplicationRecord
  belongs_to :country
  belongs_to :city
  has_many :images
  has_many :values
end
