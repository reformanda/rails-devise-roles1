class NominationsController < ApplicationController
  before_action :set_nomination, only: [:show, :edit, :update, :destroy]
  before_action :set_nomination_type
  before_action :manager_or_admin_only, :except => :list

  # GET /boats
  # GET /boats.json
  def index
    @nominations = Nomination.all
    @nominations = Nomination.where("name like ?","%#{params[:search]}%") unless params[:search].blank?
    @nominations = @nominations.page params[:page] #User.all
  end

  def show
    @nomination = Nomination.find(params[:id])
    #depending on the nomination type, choose the appropriate controller

    @info = NominationType.where(["code = ?", @nomination.nomination_type.code]).first
    @info.year = @nomination.nomination_year
    @info.id = @nomination.nomination_type_id
    @nomination_type = @nomination.nomination_type.code
    @award_options = AwardOption.joins(:nomination_type).where("code  = ?", @nomination.nomination_type.code).pluck(:name,:id)
    @callback = "#"
    unless current_user.admin?
      unless @user == current_user
        redirect_to action: "index", :alert => "Access denied."
      end
    end
  end

  def list
    @nominations = Nomination.all
    @nomination_types = NominationType.all
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    respond_to do |format|
      if @nomination.update(boat_params)
        format.html { redirect_to @nomination, notice: 'Nomination was successfully updated.' }
        format.json { render :show, status: :ok, location: @nomination }
      else
        format.html { render :edit }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @nomination.destroy
    respond_to do |format|
      format.html { redirect_to nominations_url, notice: 'Nomination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def manager_or_admin_only
      unless current_user.admin? || current_user.manager?
        redirect_to :root, :alert => "Access denied."
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_nomination
      @nomination = Nomination.find(params[:id])
    end

    def set_nomination_type
       @nomination_type = nomination_type
    end

    def nomination_type
        Nomination.nomination_types.include?(params[:type]) ? params[:type] : "Nomination"
    end

    def nomination_type_class
        nomination_type.constantize
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nomination_params
      params.require(:nomination).permit(
      :unit_commander_title,
      :unit_commander_first_name,
      :unit_commander_last_name,
      :unit_commander_suffix,
      :unit_commander_phone,
      :unit_commander_email,
      :unit_commander_organization,
      :nominating_official_title,
      :nominating_official_first_name,
      :nominating_official_last_name,
      :nominating_official_suffix,
      :nominating_official_phone,
      :nominating_official_email,
      :nominating_point_of_contact_title,
      :nominating_point_of_contact_first_name,
      :nominating_point_of_contact_last_name,
      :nominating_point_of_contact_suffix,
      :nominating_point_of_contact_phone,
      :nominating_point_of_contact_email,
      :nominating_point_of_contact_organization_address_1,
      :nominating_point_of_contact_organization_address_2,
      :nominating_point_of_contact_city,
      :nominating_point_of_contact_state,
      :nominating_point_of_contact_zip,
      :nominating_point_of_contact_country,
      :award_option_id,
      :nominee_title,
      :nominee_first,
      :nominee_last,
      :nominee_suffix,
      :nominee_position_title,
      :nominee_email,
      :nominee_organization,
      :nominee_command,
      :endorsement_letter,
      :submission_form,
      :photo_a,
      :photo_b,
      :nomination_type_id,
      :nomination_year,
      :nominee_team_name,
      :submission_form_cache,
      :endorsement_letter_cache,
      :photo_a_cache)
    end


end
