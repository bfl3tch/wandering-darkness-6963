class Garden < ApplicationRecord
  has_many :plots, dependent: :destroy
  has_many :plants, through: :plots

  def garden_plants
    plants.where('days_to_harvest < ?', 100).distinct
  end

  def sorted_garden_plants

    #where did I go wrong here?

    # plots.joins(:plants).select('plants.*, count(plants.id) as count').order('count(plants.*) desc').where('days_to_harvest < ?', 100).pluck('plants.name')

  end
end
