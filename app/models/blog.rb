class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tags

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
end
