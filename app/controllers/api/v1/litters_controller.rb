module Api
  module V1
    class LittersController < ::Api::V1::BaseController
      def index # wszystkie mioty + zwierzeta w danym miocie + ojciec miotu + mama miotu + wlasciciel miotu
        litters = Litter.includes(:animals)

        render json: LitterRepresenter.for_collection.prepare(litters).to_json
      end

      def create
        litter = Litter.new(litter_params)
        current_breeder.litters << litter

        render json: LitterRepresenter.new(litter.reload).to_json
      end

      def show # pojedynczy miot + zwierzeta + ojciec + mama + wlasciciel miotu
        litter = Litter.find(params[:id])

        render json: LitterRepresenter.new(litter).to_json
      end

      private

      def litter_params
        params.require(:litter).permit(:name, :birth_date, :expected_traits)
      end
    end
  end
end
