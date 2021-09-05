class Category < ApplicationRecord
  validates :names, presence: true, length: {minimum: 3, maximum: 25}
  validates_uniqueness_of :names
end
