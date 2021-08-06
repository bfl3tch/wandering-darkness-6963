require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  describe 'instance methods' do
    before(:each) do
      @garden1 = Garden.create!(name: 'garden1', organic: true)
      @garden2 = Garden.create!(name: 'garden2', organic: false)

      @plot1 = @garden1.plots.create!(number: 1, size: 'large', direction: 'east')
      @plot2 = @garden1.plots.create!(number: 2, size: 'medium', direction: 'east')
      @plot3 = @garden1.plots.create!(number: 3, size: 'small', direction: 'west')
      @plot4 = @garden2.plots.create!(number: 4, size: 'huge', direction: 'south')

      @plant1 = @plot1.plants.create!(name: 'sweet pepper', description: 'Rich soil', days_to_harvest: 9)
      @plant2 = @plot1.plants.create!(name: 'bean', description: 'spicy', days_to_harvest: 9)
      @plant3 = @plot1.plants.create!(name: 'bland carrot', description: 'orange', days_to_harvest: 9)
      @plant9 = @plot1.plants.create!(name: 'tester', description: 'fake1', days_to_harvest: 99)
      @plant10 = @plot1.plants.create!(name: 'tester2', description: 'fake2', days_to_harvest: 105)


      @plant4 = @plot2.plants.create!(name: 'olive', description: 'gross', days_to_harvest: 9)
      @plant5 = @plot2.plants.create!(name: 'cabbage', description: 'undeciced', days_to_harvest: 9)

      @plant6 = @plot3.plants.create!(name: 'bitter kale', description: 'nope', days_to_harvest: 9)
      @plant7 = @plot3.plants.create!(name: 'cherry tomato', description: 'delicious', days_to_harvest: 9)
      @plant8 = @plot4.plants.create!(name: 'watermelon', description: 'everywhere', days_to_harvest: 60)
      @plant11 = @plot4.plants.create!(name: 'watermelon', description: 'everywhere', days_to_harvest: 150)
    end
    describe '#garden_plants' do
      it 'displays plants in the garden with a time to harvest less than 100' do
        expected = [@plant1, @plant2, @plant3, @plant9, @plant4, @plant5, @plant6, @plant7]
        expect(@garden1.garden_plants).to eq(expected)
      end
    end
  end
end
