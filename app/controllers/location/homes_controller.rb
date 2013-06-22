class Location::HomesController < RemRestController

  # GET /location/homes

  def initialize
    @resource = 'home'
    @resources = 'homes'
    @model = Location::Home
  end

end
