class AwardsController < ApplicationController

  def packard
    @nomination_type = "packard"
    @award_options = ["Program Management"]
    render :layout => "nomination"
  end

end
