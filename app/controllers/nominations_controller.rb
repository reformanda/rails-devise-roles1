class NominationsController < ApplicationController
  before_action :set_nomination, only: [:show, :edit, :update, :destroy]


  def index
    @nominations = Nomination.all
  end

  def show
  end

  def update
  end

  def destroy
  end

  def packard
    @nomination = Nomination.new
    @nomination_type = "packard"
    @award_options = [["Program Management",1]]
    render :nomination, :layout => "nomination_form"
  end

  def edit
  end

  def error
    @nomination_type = session[:nomination_type]
    render :layout => "nomination_form"
  end

  def submitted
    @nomination_type = session[:nomination_type]
    render :layout => "nomination_form"
  end

  def create
    @nomination = Nomination.new(nomination_params)
    session[:nomination_type]  = params[:nomination_type]

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to '/nominations/submitted'}
        format.json { render :show, status: :created, location: @nomination }
      else
        format.html { redirect_to '/nominations/error'}
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nomination
      @nomination = Nomination.find(params[:id])
      #@nomination = Nomination.find(0)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nomination_params
      params.require(:nomination).permit(:ucho_title,
      :ucho_first,
      :ucho_last,
      :ucho_suffix,
      :ucho_phone,
      :ucho_email,
      :ucho_organization,
      :nomoff_title,
      :nomoff_first,
      :nomoff_last,
      :nomoff_suffix,
      :nomoff_phone,
      :nomoff_email,
      :poc_title,
      :poc_first,
      :poc_last,
      :poc_suffix,
      :poc_phone,
      :poc_email,
      :poc_org_address_1,
      :poc_org_address_2,
      :poc_city,
      :poc_state,
      :poc_zip,
      :poc_country,
      :award,
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
      :nomination_type,
      :nomination_year)
    end

end
