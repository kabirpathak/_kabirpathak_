class Video < ApplicationRecord
  belongs_to :collection, optional: true
end
