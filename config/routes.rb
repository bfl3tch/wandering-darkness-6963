Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :plots

delete '/plots/:plot_id/plants/:plant_id', to: 'harvests#destroy', as: 'harvest'

end
