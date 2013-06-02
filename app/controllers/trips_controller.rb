class TripsController < RemRestController

  def initialize
    @resource = 'trip'
    @resources = 'trips'
    @model = Trip
  end

end
