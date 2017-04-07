class ScoreMailer < ApplicationMailer

  def error_email(judge_name, board))
    @judge_name = judge_name
    @board = board
    mail(to: "jwilson1@networkrunners.com,CATHERINE.H.DERAN@saic.com", subject: "[USAASC Virtual Boards] Score Error")
  end

  def saving_scores_email(judge_name, params, nominations, board)
    @judge_name = judge_name
    @params = params
    @nominations = nominations
    @board = board
    mail(to: "jwilson1@networkrunners.com,CATHERINE.H.DERAN@saic.com", subject: "[USAASC Virtual Boards] Scores Saved")
  end

end
