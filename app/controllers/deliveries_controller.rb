class DeliveriesController < ApplicationController
    before_filter :signed_in_user, only: [:index]
    before_filter :get_user, :only => [:index]

    def new
        @delivery = Delivery.new
        if signed_in?
            @recent_addresses = current_user.deliveries.limit(10)
        else
            @user = User.new
        end
    end

    def create
        @user = current_user
        @delivery = @user.deliveries.build(params[:delivery])
        if @delivery.save
            flash[:success] = "Fast Eddie is on his way."
            redirect_to root_path
        else
            render 'new'
        end
    end

    def index
        @deliveries = @user.deliveries
    end

      private

      def get_user
        @user = User.find(params[:user_id])
      end

end