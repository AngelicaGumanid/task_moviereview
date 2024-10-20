class Movie < ApplicationRecord
  has_and_belongs_to_many :genres
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def average_rating
    reviews.average(:rating).to_f.round(2) || 0
  end

  validates :title, presence: true
  validates :blurb, presence: true, length: { minimum: 10 }
  validates :date_released, presence: true
  validates :country_of_origin, presence: true
  validates :showing_start, presence: true
  validates :showing_end, presence: true

  before_create :generate_short_url

  def generate_short_url
    self.short_url = SecureRandom.alphanumeric(7)
  end

end
