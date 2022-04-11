class Tag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  belongs_to :blog
end
