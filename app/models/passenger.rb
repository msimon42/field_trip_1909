class Passenger < ApplicationRecord
  validates_presence_of :name, :age
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights

  def add_flight(number)
    flight = Flight.find_by(number: number)
    self.flights << flight
  end
end
