class FlexsController < ApplicationController
  before_action :set_nomination, only: [:show, :edit, :update, :destroy]
  before_action :set_nomination_type


  # GET /boats
  # GET /boats.json
  def index
    @nominations = Nomination.all
  end

  # GET /boats/1
  # GET /boats/1.json
  def confirmation
    @info = NominationType.where(["code = ?", "Flex"]).first
  end

  # GET /boats/new
  def new
    @nomination = Flex.new
    @info = NominationType.where(["code = ?", "Flex"]).first
    @award_options = AwardOption.joins(:nomination_type).where("code  = ?", "Flex").pluck(:name,:id)
    @callback = "/flexs/?#no-back"
    begin
    if Date.strptime(@info.nomination_end_date, "%m/%d/%Y").past? && !current_user.admin
      redirect_to "/nominations/expired"
    end
    rescue
    end
  end

  # GET /boats/1/edit
  def edit
  end

  # POST /boats
  # POST /boats.json
  def create
    @nomination = Flex.new(nomination_params)
    @info = NominationType.where(["code = ?", "Flex"]).first

    respond_to do |format|
      if @nomination.save
        # send email confirmation
        NominationMailer.confirmation_email(@nomination,@info).deliver_now if Rails.env.production?
        format.html { redirect_to '/flexs/confirmation', :layout => "nomination_form", notice: 'Nomination was successfully created.' }
        format.json { render :confirmation, status: :created, location: @nomination }
      else
        @award_options = AwardOption.joins(:nomination_type).where("code  = ?", "Flex").pluck(:name,:id)
        @callback = "/flexs/?#no-back"
        format.html { render :new }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nomination
      @flex = Flex.find(params[:id])
    end

    def set_nomination_type
       @nomination_type = nomination_type
    end

    def nomination_type
        Nomination.nomination_types.include?(params[:type]) ? params[:type] : "Flex"
    end

    def nomination_type_class
        nomination_type.constantize
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nomination_params
      params.require(:flex).permit(
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
      :nominee_first_name,
      :nominee_last_name,
      :nominee_suffix,
      :nominee_position_title,
      :nominee_email,
      :nominee_organization,
      :nominee_command,
      :endorsement_letter,
      :submission_form_award_narrative,
      :nominee_organization_logo,
      :nomination_type_id,
      :nomination_year,
      :nominee_team_name,
      :submission_form_award_narrative_cache,
      :endorsement_letter_cache,
      :nominee_organization_logo_cache)
    end

end
