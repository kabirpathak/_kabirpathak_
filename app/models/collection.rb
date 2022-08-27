class Collection < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
end
