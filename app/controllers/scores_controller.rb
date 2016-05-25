class ScoresController < ApplicationController

  def edit
    # determine score_type from board_id
    @board = Board.find(params[:id])
    @nomination_type = NominationType.find(@board.nomination_type)
    @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
    @nominations = Nomination.where("nomination_type_id = ? and status in ('approved','scored')", @nomination_type.id)
    @scores = Score.where("user_id = ? and board_id = ?", current_user.id, @board.id)
    puts @board.score_type
    case @board.score_type
    when 1 then
        render :score1
    else
        render :tbd
    end
  end

  def index
  end

  def update
  end

  def create
    #@nomination_type = NominationType.new(nomination_type_params)
    puts params.inspect
    @board = Board.find(params[:board_id])

    # validate
    @nom_ids = []
    params[:score_num].map { |k,v| @nom_ids << k}
    #puts @nom_ids
    validation_error = false
    @nom_ids.each do |i|
      @score = Score.new({:user_id => current_user.id, :board_id => params[:board_id], :nomination_id => i,
        :score_num => params[:score_num][i],
        :score_txt => params[:score_txt][i],
        :score_comments => params[:score_comments][i]
        })
      if not @score.valid?
          validation_error = true
          break
      end
    end

    save_error = false
    if not validation_error
      # delete all old scores
      Score.where("board_id = ? and user_id = ?", params[:board_id], current_user.id).delete_all

      @nom_ids.each do |i|
        @score = Score.new({:user_id => current_user.id, :board_id => params[:board_id], :nomination_id => i,
          :score_num => params[:score_num][i],
          :score_txt => params[:score_txt][i],
          :score_comments => params[:score_comments][i]
          })

        if not @score.save
            save_error = true
            break
        end
      end
    end

    #respond_to do |format|
      if !save_error  &&  !validation_error
         redirect_to "/boards/list", notice: 'Score was successfully created.'
    #    format.json { render :show, status: :created, location: @nomination_type }
      else
    #    format.html { render :new }
    #    format.json { render json: @nomination_type.errors, status: :unprocessable_entity }
      end
    #end
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
