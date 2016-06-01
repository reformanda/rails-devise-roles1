class NominationTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  before_action :set_nomination_type, only: [:show, :edit, :update, :destroy]

  #layout "nomination_form", only: [:new, :show, :edit]
  # GET /nomination_types
  # GET /nomination_types.json
  def index
    @nomination_types = NominationType.all
    #render :layout => "nomination_for"
  end

  # GET /nomination_types/1
  # GET /nomination_types/1.json
  def show
  end

  # GET /nomination_types/new
  def new
    @nomination_type = NominationType.new
    #render :layout => "nomination_for"
  end

  # GET /nomination_types/1/edit
  def edit
  end

  # POST /nomination_types
  # POST /nomination_types.json
  def create
    @nomination_type = NominationType.new(nomination_type_params)

    respond_to do |format|
      if @nomination_type.save
        format.html { redirect_to @nomination_type, notice: 'Nomination type was successfully created.' }
        format.json { render :show, status: :created, location: @nomination_type }
      else
        format.html { render :new }
        format.json { render json: @nomination_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nomination_types/1
  # PATCH/PUT /nomination_types/1.json
  def update
    respond_to do |format|
      val= nomination_type_params[:nomination_end_date]
      date = Date.strptime(val, "%m/%d/%Y") if val.present?
      nomination_type_params[:nomination_end_date] = date
      if @nomination_type.update(nomination_type_params)
        format.html { redirect_to @nomination_type, notice: 'Nomination type was successfully updated.' }
        format.json { render :show, status: :ok, location: @nomination_type }
      else
        format.html { render :edit }
        format.json { render json: @nomination_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nomination_types/1
  # DELETE /nomination_types/1.json
  def destroy
    @nomination_type.destroy
    respond_to do |format|
      format.html { redirect_to nomination_types_url, notice: 'Nomination type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def admin_only
      unless current_user.admin?
        redirect_to :root, :alert => "Access denied."
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_nomination_type
      @nomination_type = NominationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nomination_type_params
      params.require(:nomination_type).permit(:year, :code, :title, :nomination_end_date, :description, :awards_announcement, :implementing_instructions, :submission_form, :award_narrative, :guidelines)
    end
end
