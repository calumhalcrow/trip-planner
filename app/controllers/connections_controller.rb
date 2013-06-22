class ConnectionsController < RemRestController

  # GET /connections

  def initialize
    @resource = 'connection'
    @resources = 'connections'
    @model = Connection
  end

end
