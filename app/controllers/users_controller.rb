class UsersController < RemRestController

  def initialize
    @resource = 'user'
    @resources = 'users'
    @model = User
  end

end
