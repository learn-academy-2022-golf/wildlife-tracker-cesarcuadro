class AnimalsController < ApplicationController

    def index
        animals = Animal.all 
        render json: animals
    end

    def show
        animals = Animal.find(params[:id])
        render json: animals, include: :sightings
    end

    def create
        animals = Animal.create(animal_params)
        if animals.valid?
            render json: animals
        else
            render json: animal.errors
        end
    end

    def destroy
        animals = Animal.find(params[:id])
        if animals.destroy
            render json: animals
        else
            render json: animal.errors
        end
    end

    def update
        animals = Animal.find(params[:id])
        animals.update(animal_params)
        if animals.valid?
            render json: animals
        else
            render json: animal.errors
        end
    end

    private
    def animal_params
        params.require(:animal).permit(:common_name, :scientific_binomial, :sighting)
    end

end
