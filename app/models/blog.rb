class Blog < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 20 }

  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
end
