class Garden < ApplicationRecord
  has_many :plots, dependent: :destroy
  has_many :plants, through: :plots
end
