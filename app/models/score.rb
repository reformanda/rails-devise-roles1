class Score < ActiveRecord::Base
  belongs_to :board
  # using a method:
  attr_accessor :checker

  validate :score_1_no_multiple_9

  def score_1_no_multiple_9
    #puts "***HELLO***"
    #puts board.score_type_id
    #puts "***GOODBYE***"
    if board.score_type_id == 1
      cntnine = []
      puts checker
      checker.each { |x| cntnine << x if x == "9"}
      if cntnine.length > 1
        errors.add(:base, "There can only be 1 score of 9")
      end
    else
      true # do your checking and return true or false
    end
  end

end
