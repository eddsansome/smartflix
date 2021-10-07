# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :director
  has_many :movie_actors
  has_many :movie_writers
  has_many :actors, :through => :movie_actors
  has_many :writers, :through => :movie_writers

  validates :title, uniqueness: true
  scope :not_fresh, -> { where(created_at: Time.zone.now - 2.days) }
  scope :find_by_slug, ->(slug) { where(slug: slug) }
end
