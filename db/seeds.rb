# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Garden.create(name: 'Turing Community Garden', organic: true)
# Garden.create(name: 'Main Street Garden', organic: false)
#
# Garden.first.plots.create(number: 345, size: 'Medium', direction: 'North')
# Garden.first.plots.create(number: 346, size: 'Large', direction: 'East')
# Garden.last.plots.create(number: 878, size: 'Small', direction: 'East')
# Garden.last.plots.create(number: 879, size: 'Small', direction: 'West')
#
Garden.destroy_all
Plot.destroy_all
Plant.destroy_all
@garden1 = Garden.create!(name: 'garden1', organic: true)

@plot1 = @garden1.plots.create!(number: 1, size: 'large', direction: 'east')
@plot2 = @garden1.plots.create!(number: 2, size: 'medium', direction: 'east')
@plot3 = @garden1.plots.create!(number: 3, size: 'small', direction: 'west')

@plant1 = @plot1.plants.create!(name: 'sweet pepper', description: 'Rich soil', days_to_harvest: 9)
@plant2 = @plot1.plants.create!(name: 'bean', description: 'spicy', days_to_harvest: 9)
@plant3 = @plot1.plants.create!(name: 'bland carrot', description: 'orange', days_to_harvest: 9)
@plant4 = @plot2.plants.create!(name: 'olive', description: 'gross', days_to_harvest: 9)
@plant5 = @plot2.plants.create!(name: 'cabbage', description: 'undeciced', days_to_harvest: 9)
@plant6 = @plot3.plants.create!(name: 'bitter kale', description: 'nope', days_to_harvest: 9)
@plant7 = @plot3.plants.create!(name: 'cherry tomato', description: 'delicious', days_to_harvest: 9)

@harvest1 = Harvest.create!(plot: @plot2, plant: @plant1)
@harvest1 = Harvest.create!(plot: @plot3, plant: @plant1)
@harvest1 = Harvest.create!(plot: @plot2, plant: @plant2)
