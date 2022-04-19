class Tag < ApplicationRecord
  belongs_to :blog

  validates :name, presence: true, length: { minimum: 2 }
end
