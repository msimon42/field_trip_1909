require 'rails_helper'

RSpec.describe 'When I visit a passenger show page' do
  before :each do
    @airline = Airline.create(name: "United")
    @passenger = Passenger.create(name: 'Harry', age: 55)
    @flight_1 = @passenger.flights.create(number: "569", date: "10/10/20", time: "1300", departure_city: "Denver", arrival_city: "San Francisco", airline: @airline)
    @flight_2 = @passenger.flights.create(number: "570", date: "10/31/20", time: "1900", departure_city: "Denver", arrival_city: "Amsterdam", airline: @airline)
    @flight_3 = Flight.create(number: "571", date: "10/31/20", time: "1900", departure_city: "Denver", arrival_city: "Berlin", airline: @airline)

    visit "/passengers/#{@passenger.id}"
  end

  it 'i can see all passenger info' do
    expect(page).to have_content(@passenger.name)
    expect(page).to have_link(@flight_1.number)
    expect(page).to have_link(@flight_2.number)
    expect(page).to_not have_link(@flight_3.number)
  end

  it 'i click on flight number and am redirected to flight show' do
    click_link(@flight_1.number)
    expect(current_path).to eq("/flights/#{@flight_1.id}")
  end

  it 'i can add a flight by filling in the add flight form' do
    fill_in :flight_number, with: '571'
    click_button 'Submit'

    expect(current_path).to eq("/passengers/#{@passenger.id}")
    expect(page).to have_content(@flight_3.number)
  end
end
