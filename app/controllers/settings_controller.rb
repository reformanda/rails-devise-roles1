class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  def set
  end

  def update
    #puts params.inspect
    #puts params[:award_year]
    Settings.add_source!({current_year: params[:award_year]})
    Settings.reload!
    redirect_to "/settings"
  end

  private

    def admin_only
      unless current_user.admin?
        redirect_to :root, :alert => "Access denied."
      end
    end

end
