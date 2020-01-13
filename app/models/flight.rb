class Flight <ApplicationRecord
  validates_presence_of :number, :date, :time, :departure_city, :arrival_city
  validates_uniqueness_of :number
  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  def adult_count
    passengers.where('age >= ?', 18).count
  end

  def minor_count
    passengers.where('age < ?', 18).count
  end   
end
