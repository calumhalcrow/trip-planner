class TripsController < RemRestController

  def initialize
    @resource = 'trip'
    @resources = 'trips'
    @model = Trip
  end

  def show
    trip = find_resource

    show = {
      @resource => {
        :name     => trip.name,
        :destination_id => trip.destination._id,
        :connection_ids => trip.connections.map { |conn| conn._id },
        :user_id => trip.user._id,
      }
    }
    respond_with show
  end

end
