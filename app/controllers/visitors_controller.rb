class VisitorsController < ApplicationController
  def index
    puts current_user
    if current_user != nil
      redirect_to :landing_index
    end
    @nomination_types = NominationType.all
  end
end
