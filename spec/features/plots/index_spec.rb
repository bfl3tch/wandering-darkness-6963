require 'rails_helper'

RSpec.describe 'The plots index page' do
  before(:each) do
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

    visit plots_path
  end
  it 'lists all plot numbers' do
    expect(page).to have_content(@plot1.number)
    expect(page).to have_content(@plot2.number)
    expect(page).to have_content(@plot3.number)
  end
  it 'displays all plots plants names' do
    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)
    expect(page).to have_content(@plant3.name)
    expect(page).to have_content(@plant4.name)
    expect(page).to have_content(@plant5.name)
    expect(page).to have_content(@plant6.name)
    expect(page).to have_content(@plant7.name)
  end

  it 'displays a link to remove the plant from the plot' do
    expect(page).to have_button("Remove #{@plant1.name}")
    expect(page).to have_button("Remove #{@plant2.name}")
    expect(page).to have_button("Remove #{@plant3.name}")
    expect(page).to have_button("Remove #{@plant4.name}")
    expect(page).to have_button("Remove #{@plant5.name}")
    expect(page).to have_button("Remove #{@plant6.name}")
    expect(page).to have_button("Remove #{@plant7.name}")
  end

  it 'removes the plant from the plot without deleting the plant entirely' do
    click_on "Remove #{@plant1.name}"

    expect(current_path).to eq(plots_path)
    expect(page).to_not have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)

    click_on "Remove #{@plant2.name}"
    expect(page).to_not have_content(@plant2.name)
    expect(page).to have_content(@plant3.name)

  end
end
