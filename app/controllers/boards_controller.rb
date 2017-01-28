class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: [:list, :expired]
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def expired
  end

  # GET /boards
  # GET /boards.json
  def index
    if params[:board_year].nil?
      params[:board_year] = Settings.current_year
    end
    @boards = Board.all
    @boards = @boards.where("year = ?", params[:board_year]) unless not params[:board_year].blank?
    @usernames = User.all.order(:id)

  end

  def list
    @boards = Board.where(["year = ?", Settings.current_year])
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
    @users_list = User.all.pluck(:name,:id)
    @score_types = ScoreType.all.pluck(:description,:id)
    @nomination_types = NominationType.all.pluck(:code,:id)
  end

  # GET /boards/1/edit
  def edit
    @users_list = User.all.pluck(:name,:id)
    @nomination_types = NominationType.all.pluck(:code,:id)
    @score_types = ScoreType.all.pluck(:description,:id)
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    @users_list = User.all.pluck(:name,:id)
    @score_types = ScoreType.all.pluck(:description,:id)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update

    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
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
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:description, :start_date, :end_date, :nomination_type_id, :score_type_id, :year, :users_list => [])
    end
end
