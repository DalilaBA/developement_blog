class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimum: 6, maximum: 100} #makes sure that a title is never empty or nil, adding lengh in order to force a min and max lengh
    validates :description, presence: true, length: {minimum: 10 } #makes sure that a title is never empty or nil
end    