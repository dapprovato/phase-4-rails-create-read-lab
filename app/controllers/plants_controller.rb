class PlantsController < ApplicationController

    def index
        plants = Plants.all
        render json: plants
    end

    def show
        plant = Plants.find_by(params[:id])
        if plant
            render json: plant
        else
            render json: { error: 'Plant not found'}, status: :not_found
        end
    end

    def create
        plant = Plant.create(params.permit(:name, :species, :price))
        render json: plant, status: :created
    end

end
