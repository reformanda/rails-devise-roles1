class ScoresController < ApplicationController

  def edit
    # determine score_type from board_id
    @board = Board.find(params[:id])
    @nomination_type = NominationType.find(@board.nomination_type)
    @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
    @nominations = Nomination.where("nomination_type_id = ?", @nomination_type.id)
    case @board.score_type
    when 1 then
        render :score1
    end
  end

  def index
  end

  def update
  end

  def create
    #@nomination_type = NominationType.new(nomination_type_params)

    respond_to do |format|
    #  if @nomination_type.save
        format.html { redirect_to "/boards/list", notice: 'Score was successfully created.' }
    #    format.json { render :show, status: :created, location: @nomination_type }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @nomination_type.errors, status: :unprocessable_entity }
    #  end
    end
  end

  private

  # a score is a collection of scores by a user for a group of nominations

  def set_score
    @score = Score.where("board_id = ?",params[:id])
  end

  def score_params
    params.require(:score).permit(:score_num => [], :score_txt => [], :score_comments => [])
  end

end
