class LandingController < ApplicationController
  def index
 
  end

  def nomination
    render :layout => "nomination"
  end

  def version
    render :layout => "empty"
  end

  def nojavascript

  end

end
