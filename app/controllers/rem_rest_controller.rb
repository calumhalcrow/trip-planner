class RemRestController < ApplicationController

  # Ensure these are set by subclass?
  @resource
  @resources
  @model

  # GET /resources
  # GET /resources?ids[]=123456
  def index
    resources = find_resources.map { |resource| {:id => resource._id, :name => resource.name } }
    show = { @resources => resources }
    render json: show
  end

  # GET /resources/1
  def show
    resource = find_resource
    show = { @resource => resource }
    render json: show
  end

  # GET /resources/new
  def new
    show = { @resource => find_resource }
    render json: show
  end

  # GET /resources/1/edit
  def edit
    @resource = (@resource.capitalize).find(params[:id])
  end

  # POST /resources
  def create
    resource = find_resource
    resource.save
    show = { @resource => resource }
    render json: show
  end

  # PUT /resources/1
  def update
    resource = find_resource
    resource.update_attributes(params[@resource])
    show = { @resource => resource }
    render json: show
  end

  # DELETE /resources/1
  def destroy
    resource = find_resource
    resource.destroy
    show = { @resource => resource }
    render json: show
  end

  private

  def find_resource
    params[:action] =~ /new|create/ ? @model.new(params[@resource]) : @model.find(params[:id])
  end

  def find_resources
    params[:ids] ? @model.find(params[:ids]) : @model.all
  end
end
