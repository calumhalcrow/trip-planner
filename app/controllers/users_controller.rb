class UsersController < ApplicationController

  respond_to :json

  # GET /users
  # GET /users?ids[]=123456
  def index
    users = find_users.map { |user| {:id => user._id, :name => user.name } }
    show = { :users => users }
    respond_with show
  end

  # GET /users/1
  def show
    user = find_user
    show = {
      :user => {
        :name     => user.name,
        :email    => user.email,
        :trip_ids => user.trips.map { |trip| trip._id },
      }
    }
    respond_with show
  end

  # GET /users/new
  def new
    show = { :user => find_user }
    respond_with show
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    user = find_user
    user.save
    show = { :user => user }
    respond_with show
  end

  # PUT /users/1
  def update
    user = find_user
    user.update_attributes(params[:user])
    show = { :user => user }
    respond_with show
  end

  # DELETE /users/1
  def destroy
    user = find_user
    user.destroy
    show = { :user => user }
    respond_with show
  end

  private

  def find_user
    params[:action] =~ /new|create/ ? User.new(params[:user]) : User.find(params[:id])
  end

  def find_users
    params[:ids] ? User.find(params[:ids]) : User.all
  end
end
