class HomesController < RemRestController

  # GET /homes

  def initialize
    @resource = 'home'
    @resources = 'homes'
    @model = Home
  end

end
