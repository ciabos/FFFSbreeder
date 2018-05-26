class BreederRepresenter < Roar::Decorator
  include Roar::JSON::JSONAPI.resource :breeders

  attributes do
    property :name
    property :rattery_name
  end

  has_many :litters do
    property :name
  end

  has_many :animals do
    property :name
  end
end
