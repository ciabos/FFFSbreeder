class AnimalRepresenter < Roar::Decorator
  include Roar::JSON::JSONAPI.resource :animals

  attributes do
    property :created_at
    property :sex
    property :name
    property :home_name
    property :phenotype
    property :genotype
    property :additional_info
  end

  has_one :litter do
    property :name
  end
end
