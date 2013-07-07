class UsersController < RemRestController

  def initialize
    @resource = 'user'
    @resources = 'users'
    @model = User
  end

  # GET /users/1
  def show
    user = find_resource
    show = {
      @resource => {
        :name     => user.name,
        :email    => user.email,
        :trip_ids => user.trips.map { |trip| trip._id },
      }
    }

    if user.home?
      show[@resource][:home_id] = user.home._id
    end

    render json: show
  end
end
