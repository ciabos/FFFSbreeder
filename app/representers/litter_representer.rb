class LitterRepresenter < Roar::Decorator
  include Roar::JSON::JSONAPI.resource :litters

  attributes do
    property :name
    property :birth_date
    property :expected_traits
  end

  has_one :breeder do
    property :name
  end
  has_one :father do
    property :name
  end
  has_one :mother do
    property :name
  end

  has_many :animals do
    property :name
  end
end
