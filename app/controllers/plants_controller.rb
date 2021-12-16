class PlantsController < ApplicationController


    def index
        plants = Plant.all
        render json: plants ,status: :ok
    end
    
    def create
        new_plant = Plant.create(params.permit(:name,:image,:price))
        render json: new_plant , status: :created
    end

    def names
        byebug
        # names = Plant.find_by(name: params[:name])
        render json: names , status: :ok
    end

    def show
        id = Plant.find_by(id: params[:id])
        if id
        render json: id ,status: :ok
        else 
            render json: {error: "NO ID"}, status: :not_found
        end
    end
end
