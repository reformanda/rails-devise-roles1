class VisitorsController < ApplicationController
  def index
    @nomination_types = NominationType.all
  end
end
