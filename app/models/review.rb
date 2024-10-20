class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }  # Ensure rating is between 1 and 5
end
