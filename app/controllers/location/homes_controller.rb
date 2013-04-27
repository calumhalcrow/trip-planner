class Location::HomesController < ApplicationController
  # GET /location/homes
  # GET /location/homes.json
  def index
    @location_homes = Location::Home.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_homes }
    end
  end

  # GET /location/homes/1
  # GET /location/homes/1.json
  def show
    @location_home = Location::Home.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_home }
    end
  end

  # GET /location/homes/new
  # GET /location/homes/new.json
  def new
    @location_home = Location::Home.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_home }
    end
  end

  # GET /location/homes/1/edit
  def edit
    @location_home = Location::Home.find(params[:id])
  end

  # POST /location/homes
  # POST /location/homes.json
  def create
    @location_home = Location::Home.new(params[:location_home])

    respond_to do |format|
      if @location_home.save
        format.html { redirect_to @location_home, notice: 'Home was successfully created.' }
        format.json { render json: @location_home, status: :created, location: @location_home }
      else
        format.html { render action: "new" }
        format.json { render json: @location_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /location/homes/1
  # PUT /location/homes/1.json
  def update
    @location_home = Location::Home.find(params[:id])

    respond_to do |format|
      if @location_home.update_attributes(params[:location_home])
        format.html { redirect_to @location_home, notice: 'Home was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location/homes/1
  # DELETE /location/homes/1.json
  def destroy
    @location_home = Location::Home.find(params[:id])
    @location_home.destroy

    respond_to do |format|
      format.html { redirect_to location_homes_url }
      format.json { head :no_content }
    end
  end
end
