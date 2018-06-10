module Api
  module V1
    class AnimalsController < ::Api::V1::BaseController
      def create
        animal = Animal.new(animal_params)
        litter = current_breeder.litters.find(animal_params[:litter_id])
        litter.animals << animal

        render json: AnimalRepresenter.new(animal.reload).to_json
      end

      def show
        animal = Animal.find(params[:id])

        render json: AnimalRepresenter.new(animal).to_json
      end

      private

      def animal_params
        params.require(:animal).permit(:sex, :name, :home_name, :phenotype, :genotype, :litter_id)
      end
    end
  end
end
