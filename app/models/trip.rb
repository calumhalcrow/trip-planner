class Trip
  include Mongoid::Document
  field :name, type: Str
  embedded_in :destination
end
