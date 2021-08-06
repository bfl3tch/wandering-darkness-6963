class Harvest < ApplicationRecord
  belongs_to :plant
  belongs_to :plot
end
