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
    @award_options = ["Program Management"]
    render :layout => "nomination_form"
  end

  def edit
  end

  def error
    render :layout => "nomination_form"
  end

  def create
    @nomination = Nomination.new(nomination_params)

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to @nomination, notice: 'Nomination was successfully created.' }
        format.json { render :show, status: :created, location: @nomination }
      else
        format.html { redirect_to "/nominations/error/", notice: "Nomination was not created.", action: "#{params[:nomination_type]}" }
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
      params.require(:nomination).permit(:ucho_title,:ucho_first)
    end

end
