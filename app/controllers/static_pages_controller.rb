class StaticPagesController < ApplicationController

  def home
    @delivery = Delivery.new
  end

end