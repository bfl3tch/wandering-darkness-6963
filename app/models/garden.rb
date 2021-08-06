class Garden < ApplicationRecord
  has_many :plots, dependent: :destroy
  has_many :plants, through: :plots

  def garden_plants
    plants.where('days_to_harvest < ?', 100).distinct
  end

  def sorted_garden_plants
    # require "pry"; binding.pry
    plots.joins(:plants).select('count(plants.*)')
    # SELECT * from harvests INNER JOIN plots on harvests.plot_id = plots.id INNER JOIN plants on harvests.plant_id = plants.id INNER JOIN gardens ON gardens.id = 1;
  end
end
