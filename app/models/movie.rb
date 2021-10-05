# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :title, uniqueness: true
  scope :not_fresh, -> { where(created_at: Time.zone.now - 1.day) }
end
