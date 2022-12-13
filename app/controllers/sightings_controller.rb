class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings
    end

    def show
        sightings = Sighting.find(params[:id])
        render json: sightings
    end

    def create
        sightings = Sighting.create(sighting_params)
        if sightings.valid?
            render json: sightings
        else
            render json: sightings.errors
        end
    end

    def destroy
        sightings = Sighting.find(params[:id])
        if sightings.destroy
            render json: sightings
        else
            render json: sightings.errors
        end
    end

    def update
        sightings = Sighting.find(params[:id])
        sightings.update(sighting_params)
        if sightings.valid?
            render json: sightings
        else
            render json: sightings.errors
        end
    end

    private
    def sighting_params
        params.require(:sighting).permit(:longitude, :latitude, :date, :animal_id)
    end

end
