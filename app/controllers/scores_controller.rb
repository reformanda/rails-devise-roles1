class ScoresController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_or_judge_only, :except => [:create]
  before_action :admin_only, :only => [:score_report, :reports]

  def score_report
    @board = Board.find(params[:id])
    #puts @board.inspect
    #puts @board.users_list.inspect
    @nomination_type = NominationType.find(@board.nomination_type_id)
    @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
    #@nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    @scores = Score.where("board_id = ?", @board.id)
    @users_list1 = @scores.uniq.pluck(:user_id)
    @users_list2 = (@users_list1.to_a + @board.users_list.each.map(&:to_i)).uniq
    @users_list2.delete_if { |x| x==0 }
    #puts @users_list2.inspect
    #puts @scores.uniq.pluck(:user_id)
    #puts @scores.inspect
    # if tie breaker, then only select tied nominations
    if @board.score_type_id == 8
      # which board is tie breaker for?
      begin
        tie_board = Board.where("year = ? and nomination_type_id = ? and score_type_id != 8",@board.year, @board.nomination_type_id)
        nominations_ids = TieNominationsView.where("board_id = ?", tie_board.first.id).pluck(:nomination_id)
      rescue
        nominations_ids = nil
      end
      @nominations = Nomination.where("id in (?)", nominations_ids)
    else
      @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    end
    #@nominations = @nominations.where("nomination_year = ?", @board.year)
    begin
    @score_type = ScoreType.find(@board.score_type_id)
    rescue
    end



  end

  def reports
    if params[:board_year].nil?
      params[:board_year] = Settings.current_year
    end
    @boards = Board.all
    @boards = @boards.where("year = ?", params[:board_year]) unless params[:board_year].blank?
    @usernames = User.all.order(:id)
  end

  def score_print
    @board = Board.find(params[:id])
    @nomination_type = NominationType.find(@board.nomination_type_id)
    @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
    #@nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    #@scores = Score.where("user_id = ? and board_id = ?", current_user.id, @board.id)
    @scores = Score.where("board_id = ?", @board.id)
    @users_list1 = @scores.uniq.pluck(:user_id)
    @users_list2 = (@users_list1.to_a + @board.users_list.each.map(&:to_i)).uniq
    @users_list2.delete_if { |x| x==0 }
    # if tie breaker, then only select tied nominations
    if @board.score_type_id == 8
      # which board is tie breaker for?
      begin
        tie_board = Board.where("year = ? and nomination_type_id = ? and score_type_id != 8",@board.year, @board.nomination_type_id)
        nominations_ids = TieNominationsView.where("board_id = ?", tie_board.first.id).pluck(:nomination_id)
      rescue
        nominations_ids = nil
      end
      @nominations = Nomination.where("id in (?)", nominations_ids)
    else
      @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    end
    #@nominations = @nominations.where("nomination_year = ?", @board.year)
    begin
    @score_type = ScoreType.find(@board.score_type_id)
    rescue
    end

    render :layout => "empty"


  end

  def edit
    # determine score_type from board_id
    @board = Board.find(params[:id])
    puts @board.inspect
    begin
      if DateTime.strptime(@board.end_date, '%m/%d/%Y').past?
        redirect_to "/boards/expired"
      end
    rescue => e
      puts e.inspect
    end

    @nomination_type = NominationType.find(@board.nomination_type_id)
    @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
    puts @nomination_type.inspect
    # if tie breaker, then only select tied nominations
    if @board.score_type_id == 8
      # which board is tie breaker for?
      begin
        tie_board = Board.where("year = ? and nomination_type_id = ? and score_type_id != 8",@board.year, @board.nomination_type_id)
        nominations_ids = TieNominationsView.where("board_id = ?", tie_board.first.id).pluck(:nomination_id)
      rescue
        nominations_ids = nil
      end
      @nominations = Nomination.where("id in (?)", nominations_ids)
    else
      @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    end
    @nominations = @nominations.where("nomination_year = ?", @board.year)
    @scores = Score.where("user_id = ? and board_id = ?", current_user.id, @board.id)
    puts @scores.inspect
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
    #@nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    @scores = Score.where("user_id = ? and board_id = ?", current_user.id, @board.id)

    # if tie breaker, then only select tied nominations
    if @board.score_type_id == 8
      # which board is tie breaker for?
      begin
        tie_board = Board.where("year = ? and nomination_type_id = ? and score_type_id != 8",@board.year, @board.nomination_type_id)
        nominations_ids = TieNominationsView.where("board_id = ?", tie_board.first.id).pluck(:nomination_id)
      rescue
        nominations_ids = nil
      end
      @nominations = Nomination.where("id in (?)", nominations_ids)
    else
      @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    end
    @nominations = @nominations.where("nomination_year = ?", @board.year)
    begin
    @score_type = ScoreType.find(@board.score_type_id)
    rescue
    end
  end

  def create
    #@nomination_type = NominationType.new(nomination_type_params)
    @board = Board.find(params[:board_id])
    @nomination_type = NominationType.find(@board.nomination_type_id)

    @judge = User.find(current_user.id)

    # look over award options
    @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
#    @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    # if tie breaker, then only select tied nominations
    if @board.score_type_id == 8
      # which board is tie breaker for?
      begin
        tie_board = Board.where("year = ? and nomination_type_id = ? and score_type_id != 8",@board.year, @board.nomination_type_id)
        nominations_ids = TieNominationsView.where("board_id = ?", tie_board.first.id).pluck(:nomination_id)
      rescue
        nominations_ids = nil
      end
      @nominations = Nomination.where("id in (?)", nominations_ids)
    else
      @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
    end
    @nominations = @nominations.where("nomination_year = ?", @board.year)

    validation_error = false
    @award_options.each do |aw|
      # load arrays for validation
      @noms = @nominations.where("award_option_id = ?", aw.id)
      if not @noms.empty?
        @score_1 = []
        @score_2 = []
        @score_3 = []
        @score_4 = []
        @score_5 = []
        @score_6 = []
        @score_7 = []
        @score_8 = []
        @score_9 = []
        @noms.each do |i|
          @score_1 << params[:score_1][i.id.to_s]
          @score_2 << params[:score_2][i.id.to_s]
          @score_3 << params[:score_3][i.id.to_s]
          @score_4 << params[:score_4][i.id.to_s]
          @score_5 << params[:score_5][i.id.to_s]
          @score_6 << params[:score_6][i.id.to_s]
          @score_7 << params[:score_7][i.id.to_s]
          @score_8 << params[:score_8][i.id.to_s]
          @score_9 << params[:score_9][i.id.to_s]
        end
        # just test one record (scores are not required)
        @score = Score.new({:user_id => current_user.id, :board_id => params[:board_id], :nomination_id => @noms.first.id,
            :checker_1 => @score_1,
            :checker_2 => @score_2,
            :checker_3 => @score_3,
            :checker_4 => @score_4,
            :checker_5 => @score_5,
            :checker_6 => @score_6,
            :checker_7 => @score_7,
            :checker_8 => @score_8,
            :checker_9 => @score_9
            })

        if not @score.valid?
          validation_error = true
          break
        end
      end
    end

    save_error = false
    if not validation_error
      Score.transaction do
        # delete all old scores
        Score.where("board_id = ? and user_id = ?", params[:board_id], current_user.id).delete_all

        #score_total = params[:score_1]+ params[:score_2]+ params[:score_3]+ params[:score_4]+ params[:score_5]+ params[:score_6]+ params[:score_7]+ params[:score_8]+ params[:score_9]
        # save all scores
        @nom_ids = []
        params[:score_1].map { |k,v| @nom_ids << k}
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
            :score_comments => params[:score_comments][i],
            :checker_1 => @score_1,
            :checker_2 => @score_2,
            :checker_3 => @score_3,
            :checker_4 => @score_4,
            :checker_5 => @score_5,
            :checker_6 => @score_6,
            :checker_7 => @score_7,
            :checker_8 => @score_8,
            :checker_9 => @score_9
            })
          puts @score.inspect
          if not @score.save
              save_error = true
              ScoreMailer.error_email(@judge.name, @board).deliver_now
              raise ActiveRecord::Rollback, "Call tech support!"
              break
          end
        end
      end
    end

    respond_to do |format|
      if !save_error  &&  !validation_error
        ScoreMailer.saving_scores_email(@judge.name, params, @nominations, @board).deliver_now
        format.html {redirect_to "/scores/#{params[:board_id]}", notice: 'Score was successfully created.'}
      else

        @board = Board.find(params[:board_id])
        @nomination_type = NominationType.find(@board.nomination_type)
        @award_options = AwardOption.where("nomination_type_id = ?", @nomination_type.id)
        #@nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
        # if tie breaker, then only select tied nominations
        if @board.score_type_id == 8
          # which board is tie breaker for?
          begin
            tie_board = Board.where("year = ? and nomination_type_id = ? and score_type_id != 8",@board.year, @board.nomination_type_id)
            nominations_ids = TieNominationsView.where("board_id = ?", tie_board.first.id).pluck(:nomination_id)
          rescue
            nominations_ids = nil
          end
          @nominations = Nomination.where("id in (?)", nominations_ids)
        else
          @nominations = Nomination.where("nomination_type_id = ? and status in (1,2)", @nomination_type.id)
        end
        @nominations = @nominations.where("nomination_year = ?", @board.year)
        @scores = Score.where("user_id = ? and board_id = ?", current_user.id, @board.id)
        @callback_params = params

        begin
        @score_type = ScoreType.find(@board.score_type_id)
        rescue
        end

        format.html { render :edit, notice: 'There was a problem saving the score; if the problem continues, please contact the System Administrator.'}

        #format.html { redirect_to "/scores/#{params[:board_id]}", notice: 'There was a problem saving the score; if the problem continues, please contact the System Administrator.'}
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
