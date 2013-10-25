class DeliveriesController < ApplicationController

    def create
        Delivery.create(params[:delivery])
        flash[:success] = "Fast Eddie is on his way."
        redirect_to root_path
    end

end