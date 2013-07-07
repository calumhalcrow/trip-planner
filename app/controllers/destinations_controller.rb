class DestinationsController < RemRestController

  # GET /destinations

  def initialize
    @resource = 'destination'
    @resources = 'destinations'
    @model = Destination
  end

end
