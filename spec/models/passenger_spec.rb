require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many :passenger_flights}
    it {should have_many(:flights).through(:passenger_flights)}
  end

  describe 'instance methods' do
    before :each do
      @airline = Airline.create(name: "United")
      @passenger = Passenger.create(name: 'Harry', age: 55)
      @flight_1 = Flight.create(number: "569", date: "10/10/20", time: "1300", departure_city: "Denver", arrival_city: "San Francisco", airline: @airline)
    end

    it 'add_flight' do
      @passenger.add_flight(@flight_1.number)
      expect(@passenger.flights).to eq([@flight_1])
    end
  end
end
