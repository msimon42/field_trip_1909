require 'rails_helper'

RSpec.describe 'When i visit a flight show page' do
  before :each do
    @airline = Airline.create(name: "United")
    @flight = Flight.create(number: "569", date: "10/10/20", time: "1300", departure_city: "Denver", arrival_city: "San Francisco", airline: @airline)
    @passenger_1 = @flight.passengers.create(name: 'Harry', age: 25)
    @passenger_2 = @flight.passengers.create(name: 'Dwight', age: 16)
    @passenger_3 = Passenger.create(name: 'Draco', age: 23)
  end

  it 'I see all information pertaining to that flight' do
    visit "/flights/#{@flight.id}"

    expect(page).to have_content(@flight.number)
    expect(page).to have_content(@flight.date)
    expect(page).to have_content(@flight.time)
    expect(page).to have_content(@flight.departure_city)
    expect(page).to have_content(@flight.arrival_city)
    expect(page).to have_content(@flight.airline.name)
    expect(page).to have_content(@passenger_1.name)
    expect(page).to have_content(@passenger_2.name)
    expect(page).to_not have_content(@passenger_3.name)
  end
end
