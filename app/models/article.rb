class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

  scope :latest, -> { order(created_at: :desc) }
  paginates_per 5
end
