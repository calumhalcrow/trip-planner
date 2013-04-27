class Location
  include Mongoid::Document
  field :name, type: String
  embedded_in :departing_from, class_name: "Connection", inverse_of: :from
  embedded_in :arriving_at, class_name: "Connection", inverse_of: :to
end
