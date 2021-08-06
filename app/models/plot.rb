class Plot < ApplicationRecord
  belongs_to :garden
  has_many :harvests
  has_many :plants, through: :harvests
end
