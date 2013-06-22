class Location::DestinationsController < RemRestController

  # GET /location/destinations

  def initialize
    @resource = 'destination'
    @resources = 'destinations'
    @model = Location::Destination
  end

end
