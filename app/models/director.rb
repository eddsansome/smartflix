class Director < ApplicationRecord
  has_many :movies

  # should names be unique?
  validates :name, presence: true
end
