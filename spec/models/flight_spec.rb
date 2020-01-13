require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
    it {should validate_uniqueness_of :number}
  end
  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many :passenger_flights}
    it {should have_many(:passengers).through(:passenger_flights)}
  end

  describe 'methods' do
    before :each do
      @airline = Airline.create(name: "United")
      @flight = Flight.create(number: "569", date: "10/10/20", time: "1300", departure_city: "Denver", arrival_city: "San Francisco", airline: @airline)
      @passenger_1 = @flight.passengers.create(name: 'Harry', age: 25)
      @passenger_2 = @flight.passengers.create(name: 'Dwight', age: 16)
      @passenger_3 = @flight.passengers.create(name: 'Draco', age: 23)
    end

    it 'adult_count' do
      expect(@flight.adult_count).to eq(2)
    end

    it 'minor_count' do
      expect(@flight.minor_count).to eq(1)
    end
  end
end
