class TripsController < RemRestController

  def initialize
    @resource = 'trip'
    @resources = 'trips'
    @model = Trip
  end

  def permitted_params
    params.require(:trip)
      .permit(:name,
              :user_id,
              :destination,
              connections: [:name,
                            :depart_at,
                            :arrive_at,
                            :stop])
  end

  def find_resource
    trip_params = permitted_params
    connections_param = trip_params.extract!(:connections)
    connections_param = connections_param[:connections]
    connections_param ||= []

    if params[:action] =~ /new|create/
      trip = @model.new
    else
      trip = @model.find(params[:id])
    end

    # Update the trip's own attributes first.
    trip.attributes = trip_params
    trip.save!

    # Update the contact's phone numbers, creating/destroying as appropriate.
    connections = []
    connections_param.each do |connection_params|
      if connection_params[:id]
        c = trip.connections.find(connection_params[:id])
        c.update_attributes(connection_params)
      else
        c = trip.connections.create(connection_params)
      end
      connections << c
    end

    trip.connections.each do |c|
      c.destroy unless connections.include?(c)
    end

    # Important! Reload to ensure that changes to its
    # associations will be serialized correctly.
    trip.reload
  end

end
