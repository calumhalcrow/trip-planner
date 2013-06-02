class TripsController < ApplicationController

  respond_to :json

  # GET /trips
  # GET /trips?ids[]=123456
  def index
    trips = find_trips.map { |trip| {:id => trip._id, :name => trip.name } }
    show = { :trips => trips }
    respond_with show
  end

  # GET /trips/1
  def show
    show = { :trip => find_trip }
    respond_with show
  end

  # GET /trips/new
  def new
    show = { :trip => find_trip }
    respond_with show
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  def create
    trip = find_trip
    trip.save
    show = { :trip => trip }
    respond_with show
  end

  # PUT /trips/1
  def update
    trip = find_trip
    trip.update_attributes(params[:trip])
    show = { :trip => trip }
    respond_with show
  end

  # DELETE /trips/1
  def destroy
    trip = find_trip
    trip.destroy
    show = { :trip => trip }
    respond_with show
  end

  private

  def find_trip
    params[:action] =~ /new|create/ ? Trip.new(params[:trip]) : Trip.find(params[:id])
  end

  def find_trips
    params[:ids] ? Trip.find(params[:ids]) : Trip.all
  end
end
