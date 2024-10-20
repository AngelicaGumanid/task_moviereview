class Movie < ApplicationRecord
  has_and_belongs_to_many :genres
  has_many :reviews

  belongs_to :user

  validates :title, presence: true
  validates :blurb, presence: true, length: { minimum: 10 }
  validates :date_released, presence: true
  validates :country_of_origin, presence: true
  validates :showing_start, presence: true
  validates :showing_end, presence: true

end
