class User
  include Mongoid::Document
  field :name, type: Str
  embedded_in :home
end
