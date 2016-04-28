class LandingController < ApplicationController
  def index
    render :layout => "empty"
  end

  def nomination
    render :layout => "nomination"
  end

end