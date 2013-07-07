class StopsController < RemRestController

  # GET /stops

  def initialize
    @resource = 'stop'
    @resources = 'stops'
    @model = Stop
  end

end
