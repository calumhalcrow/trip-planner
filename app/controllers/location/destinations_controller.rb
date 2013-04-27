class Location::DestinationsController < ApplicationController
  # GET /location/destinations
  # GET /location/destinations.json
  def index
    @location_destinations = Location::Destination.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_destinations }
    end
  end

  # GET /location/destinations/1
  # GET /location/destinations/1.json
  def show
    @location_destination = Location::Destination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_destination }
    end
  end

  # GET /location/destinations/new
  # GET /location/destinations/new.json
  def new
    @location_destination = Location::Destination.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_destination }
    end
  end

  # GET /location/destinations/1/edit
  def edit
    @location_destination = Location::Destination.find(params[:id])
  end

  # POST /location/destinations
  # POST /location/destinations.json
  def create
    @location_destination = Location::Destination.new(params[:location_destination])

    respond_to do |format|
      if @location_destination.save
        format.html { redirect_to @location_destination, notice: 'Destination was successfully created.' }
        format.json { render json: @location_destination, status: :created, location: @location_destination }
      else
        format.html { render action: "new" }
        format.json { render json: @location_destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /location/destinations/1
  # PUT /location/destinations/1.json
  def update
    @location_destination = Location::Destination.find(params[:id])

    respond_to do |format|
      if @location_destination.update_attributes(params[:location_destination])
        format.html { redirect_to @location_destination, notice: 'Destination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location/destinations/1
  # DELETE /location/destinations/1.json
  def destroy
    @location_destination = Location::Destination.find(params[:id])
    @location_destination.destroy

    respond_to do |format|
      format.html { redirect_to location_destinations_url }
      format.json { head :no_content }
    end
  end
end
