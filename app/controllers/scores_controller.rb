class ScoresController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_or_judge_only, :except => :create
  before_action :admin_only, :only => [:score_report, :reports]


  def score_report
    @board = Board.find(params[:id])
    @nomination_type = NominationType.find(@board.nomination_type)
    @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
    @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    @scores = Score.where("board_id = ?", @board.id)
    puts @nominations.inspect
    begin
    @score_type = ScoreType.find(@board.score_type_id)
    rescue
    end



  end

  def reports
    @boards = Board.all
    @usernames = User.all.order(:id).pluck(:name)
  end

  def score_print
    @board = Board.find(params[:id])
    @nomination_type = NominationType.find(@board.nomination_type)
    @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
    @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    @scores = Score.where("user_id = ? and board_id = ?", current_user.id, @board.id)
    puts @nominations.inspect
    begin
    @score_type = ScoreType.find(@board.score_type_id)
    rescue
    end
    render :layout => "empty"
  end

  def edit
    # determine score_type from board_id
    @board = Board.find(params[:id])
    @nomination_type = NominationType.find(@board.nomination_type)
    @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
    @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    @scores = Score.where("user_id = ? and board_id = ?", current_user.id, @board.id)
    puts @nominations.inspect
    begin
    @score_type = ScoreType.find(@board.score_type_id)
    rescue
    end

  end

  def index
  end

  def update
  end

  def show
    @board = Board.find(params[:id])
    @nomination_type = NominationType.find(@board.nomination_type)
    @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
    @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    @scores = Score.where("user_id = ? and board_id = ?", current_user.id, @board.id)
    puts @nominations.inspect
    begin
    @score_type = ScoreType.find(@board.score_type_id)
    rescue
    end
  end

  def create
    #@nomination_type = NominationType.new(nomination_type_params)
    puts params.inspect
    @board = Board.find(params[:board_id])

    # validate
    @nom_ids = []
    params[:score_1].map { |k,v| @nom_ids << k}
    @score_1 = []
    params[:score_1].map { |k,v| @score_1 << v}
    #puts @nom_ids
    validation_error = false
    @nom_ids.each do |i|
      @score = Score.new({:user_id => current_user.id, :board_id => params[:board_id], :nomination_id => i,
        :score_1 => params[:score_1][i],
        :score_2 => params[:score_2][i],
        :score_3 => params[:score_3][i],
        :score_4 => params[:score_4][i],
        :score_5 => params[:score_5][i],
        :score_6 => params[:score_6][i],
        :score_7 => params[:score_7][i],
        :score_8 => params[:score_8][i],
        :score_9 => params[:score_9][i],
        :checker => @score_1
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
      #score_total = params[:score_1]+ params[:score_2]+ params[:score_3]+ params[:score_4]+ params[:score_5]+ params[:score_6]+ params[:score_7]+ params[:score_8]+ params[:score_9]
      #puts score_total
      #puts "HELLO"
      @nom_ids.each do |i|
        @score = Score.new({:user_id => current_user.id, :board_id => params[:board_id], :nomination_id => i,
          :score_1 => params[:score_1][i],
          :score_2 => params[:score_2][i],
          :score_3 => params[:score_3][i],
          :score_4 => params[:score_4][i],
          :score_5 => params[:score_5][i],
          :score_6 => params[:score_6][i],
          :score_7 => params[:score_7][i],
          :score_8 => params[:score_8][i],
          :score_9 => params[:score_9][i],
          :score_total => params[:score_1][i].to_i + params[:score_2][i].to_i + params[:score_3][i].to_i + params[:score_4][i].to_i + params[:score_5][i].to_i + params[:score_6][i].to_i + params[:score_7][i].to_i + params[:score_8][i].to_i + params[:score_9][i].to_i,
          :checker => @score_1
          })
          #puts params[:score_1][i]
          #puts params[:score_2][i]
          #puts params[:score_1][i].to_i + params[:score_2][i].to_i
          #+ params[:score_2][i] + params[:score_3][i] + params[:score_4][i] + params[:score_5][i] + params[:score_6][i] + params[:score_7][i] + params[:score_8][i] + params[:score_9][i]
          #puts "HELLO"
        if not @score.save
            save_error = true
            break
        end
      end
    end

    respond_to do |format|
      if !save_error  &&  !validation_error
         format.html {redirect_to "/scores/#{params[:board_id]}", notice: 'Score was successfully created.'}
    #    format.json { render :show, status: :created, location: @nomination_type }
      else
        @board = Board.find(params[:board_id])
        @nomination_type = NominationType.find(@board.nomination_type)
        @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
        @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
        @scores = Score.where("user_id = ? and board_id = ?", current_user.id, @board.id)
        @callback_params = params
        puts @nominations.inspect
        begin
        @score_type = ScoreType.find(@board.score_type_id)
        rescue
        end


        format.html { render :edit }
    #    format.json { render json: @nomination_type.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # a score is a collection of scores by a user for a group of nominations

  def admin_only
    unless current_user.admin?
      redirect_to :root, :alert => "Access denied."
    end
  end

  def admin_or_judge_only
    unless current_user.admin? || current_user.judge?
      redirect_to :root, :alert => "Access denied."
    end
    if current_user.judge?
      board_access = Board.find(params[:id])
      if (board_access.nil?) || (board_access.users_list.nil?) || (not board_access.users_list.include?(current_user.id.to_s))
        redirect_to :root, :alert => "Access denied."
      end
    end
  end

  def set_score
    @score = Score.where("board_id = ?",params[:id])
  end

  def score_params
    params.require(:score).permit(:score_num => [], :score_txt => [], :score_comments => [])
  end

end
