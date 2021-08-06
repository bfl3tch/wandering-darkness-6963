class HarvestsController < ApplicationController

  def destroy
    require "pry"; binding.pry
    Harvest.find_by(plot_id=params[plot_id], plant_id=params[plant_id]).destroy
    redirect_to plots_path
  end

end
