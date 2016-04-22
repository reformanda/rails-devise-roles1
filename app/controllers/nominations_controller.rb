class NominationsController < ApplicationController
  before_action :set_nomination, only: [:show, :edit, :update, :destroy]
  before_action :set_nomination_type
  # GET /boats
  # GET /boats.json
  def index
    @nominations = Nomination.all
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
  end

  # GET /boats/new
  def new
    @nomination = Nomination.new
    case params[:type]
    when "Packard"
        session[:award_options] = [["Program Management",1]]
    end
  end

  # GET /boats/1/edit
  def edit
  end

  # POST /boats
  # POST /boats.json
  def create
    @nomination = Nomination.new(nomination_params)

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to @nomination, notice: 'Nomination was successfully created.' }
        format.json { render :show, status: :created, location: @nomination }
      else
        format.html { render :new }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
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
