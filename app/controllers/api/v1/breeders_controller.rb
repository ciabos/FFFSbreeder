module Api
  module V1
    class BreedersController < ::Api::V1::BaseController
      def index # wszyscy hodowcy + ich mioty + zwierzeta w miotach
        breeders = Breeder.includes(litters: :animals)

        render json: BreederRepresenter.for_collection.prepare(breeders).to_json
      end

      def show # hodowca + jego mioty + zwierzeta
        breeder = Breeder.find(params[:id])

        render json: BreederRepresenter.new(breeder).to_json
      end
    end
  end
end
