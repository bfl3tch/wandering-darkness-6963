class Plant < ApplicationRecord
  has_many :harvests
  has_many :plots, through: :harvests
end
