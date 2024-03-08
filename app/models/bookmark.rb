class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, :movie_id, :list_id, presence: true
  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id }
end
