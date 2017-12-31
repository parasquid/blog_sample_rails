class Comment < ApplicationRecord
  belongs_to :article

  scope :latest, ->(num = 20) { limit(num).order(created_at: :desc) }
end
