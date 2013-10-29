class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(params[:user])
        if @user.save
          redirect_to "https://mention-engine.chargify.com/h/3340700/subscriptions/new?reference=#{@user.obfuscated_id}"
          # flash[:success] = "Welcome #{@user.name}."
          # sign_in @user
          # redirect_to root_path
        else
          render 'new'
        end
    end

end