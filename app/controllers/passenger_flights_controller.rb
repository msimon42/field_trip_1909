class PassengerFlightsController < ApplicationController
  def create
    passenger = Passenger.find(params[:id])
    passenger.add_flight(params[:flight_number])
    redirect_to "/passengers/#{passenger.id}"
  end
end
