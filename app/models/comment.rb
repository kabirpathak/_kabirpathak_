class Comment < ApplicationRecord
  belongs_to :blog, dependent: :destroy

  validates :author, presence: true, length: { minimum: 2}
  validates :message, presence: true, length: { minimum: 5 }
end
