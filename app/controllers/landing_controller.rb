class LandingController < ApplicationController
  def index
    #render :layout => "nomination"
    #puts current_user.inspect
  end

  def nomination
    render :layout => "nomination"
  end

  def version
    render :layout => "empty"
  end

  def nojavascript
    render :layout => "empty"
  end

end
