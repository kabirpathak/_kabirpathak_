class Photo < ApplicationRecord
  # need to add validations

  belongs_to :collection, optional: true
end
