class AwardOptionsController < ApplicationController
  before_action :set_award_option, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /award_options
  # GET /award_options.json
  def index
    @award_options = AwardOption.all
  end

  # GET /award_options/1
  # GET /award_options/1.json
  def show
  end

  # GET /award_options/new
  def new
    @award_option = AwardOption.new
    @nomination_types = NominationType.pluck(:code)
    puts @nomination_types.inspect
  end

  # GET /award_options/1/edit
  def edit
  end

  # POST /award_options
  # POST /award_options.json
  def create
    @award_option = AwardOption.new(award_option_params)

    respond_to do |format|
      if @award_option.save
        format.html { redirect_to @award_option, notice: 'Award option was successfully created.' }
        format.json { render :show, status: :created, location: @award_option }
      else
        format.html { render :new }
        format.json { render json: @award_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /award_options/1
  # PATCH/PUT /award_options/1.json
  def update
    respond_to do |format|
      if @award_option.update(award_option_params)
        format.html { redirect_to @award_option, notice: 'Award option was successfully updated.' }
        format.json { render :show, status: :ok, location: @award_option }
      else
        format.html { render :edit }
        format.json { render json: @award_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /award_options/1
  # DELETE /award_options/1.json
  def destroy
    @award_option.destroy
    respond_to do |format|
      format.html { redirect_to award_options_url, notice: 'Award option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_award_option
      @award_option = AwardOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def award_option_params
      params.require(:award_option).permit(:name, :nomination_type_id)
    end
end
