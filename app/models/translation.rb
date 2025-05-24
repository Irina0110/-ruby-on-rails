class Translation < ApplicationRecord
  validates :locale, :key, :value, presence: true
end
