class Score < ActiveRecord::Base
  belongs_to :board
  # using a method:
  attr_accessor :checker_1
  attr_accessor :checker_2
  attr_accessor :checker_3
  attr_accessor :checker_4
  attr_accessor :checker_5
  attr_accessor :checker_6
  attr_accessor :checker_7
  attr_accessor :checker_8
  attr_accessor :checker_9

  validate :score_1_no_multiple_9
  validate :check_max_values_development
  validate :check_max_values_achievement
  validate :check_max_values_psm
  validate :check_max_values_psl
  validate :check_max_values_aae
  validate :rank_only

  def check_max_values_aae
    if board.score_type_id == 6 || board.score_type_id == 7
      # check for max value used more than once in each category
      cntmax = []
      checker_1.each { |x| cntmax << x if x == "9"}
      if cntmax.length > 1
        errors.add(:base, "Category 1: the max score of 9 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_2.each { |x| cntmax << x if x == "9"}
      if cntmax.length > 1
        errors.add(:base, "Category 2: the max score of 9 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_3.each { |x| cntmax << x if x == "9"}
      if cntmax.length > 1
        errors.add(:base, "Category 3: the max score of 9 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_4.each { |x| cntmax << x if x == "9"}
      if cntmax.length > 1
        errors.add(:base, "Category 4: the max score of 9 can only be assigned to one nominee.")
      end


    else
      true
    end
  end


  def check_max_values_psl
    if board.score_type_id == 4
      # check for max value used more than once in each category
      cntmax = []
      checker_1.each { |x| cntmax << x if x == "18"}
      if cntmax.length > 1
        errors.add(:base, "Category 1: the max score of 18 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_2.each { |x| cntmax << x if x == "16"}
      if cntmax.length > 1
        errors.add(:base, "Category 2: the max score of 16 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_3.each { |x| cntmax << x if x == "16"}
      if cntmax.length > 1
        errors.add(:base, "Category 3: the max score of 16 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_4.each { |x| cntmax << x if x == "13"}
      if cntmax.length > 1
        errors.add(:base, "Category 4: the max score of 13 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_5.each { |x| cntmax << x if x == "9"}
      if cntmax.length > 1
        errors.add(:base, "Category 5: the max score of 9 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_6.each { |x| cntmax << x if x == "8"}
      if cntmax.length > 1
        errors.add(:base, "Category 6: the max score of 8 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_7.each { |x| cntmax << x if x == "6"}
      if cntmax.length > 1
        errors.add(:base, "Category 7: the max score of 6 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_8.each { |x| cntmax << x if x == "6"}
      if cntmax.length > 1
        errors.add(:base, "Category 8: the max score of 6 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_9.each { |x| cntmax << x if x == "8"}
      if cntmax.length > 1
        errors.add(:base, "Category 9: the max score of 8 can only be assigned to one nominee.")
      end

    else
      true
    end
  end

  def check_max_values_psm
    if board.score_type_id == 5
      # check for max value used more than once in each category
      cntmax = []
      checker_1.each { |x| cntmax << x if x == "45"}
      if cntmax.length > 1
        errors.add(:base, "Category 1: the max score of 45 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_2.each { |x| cntmax << x if x == "30"}
      if cntmax.length > 1
        errors.add(:base, "Category 2: the max score of 30 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_3.each { |x| cntmax << x if x == "25"}
      if cntmax.length > 1
        errors.add(:base, "Category 3: the max score of 25 can only be assigned to one nominee.")
      end


    else
      true
    end
  end


  def check_max_values_achievement
    if board.score_type_id == 3
      # check for max value used more than once in each category
      cntmax = []
      checker_1.each { |x| cntmax << x if x == "50"}
      if cntmax.length > 1
        errors.add(:base, "Category 1: the max score of 50 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_2.each { |x| cntmax << x if x == "30"}
      if cntmax.length > 1
        errors.add(:base, "Category 2: the max score of 30 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_3.each { |x| cntmax << x if x == "20"}
      if cntmax.length > 1
        errors.add(:base, "Category 3: the max score of 20 can only be assigned to one nominee.")
      end


    else
      true
    end
  end

  def check_max_values_development
    if board.score_type_id == 2
      # check for max value used more than once in each category
      cntmax = []
      checker_1.each { |x| cntmax << x if x == "20"}
      if cntmax.length > 1
        errors.add(:base, "Category 1: the max score of 20 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_2.each { |x| cntmax << x if x == "20"}
      if cntmax.length > 1
        errors.add(:base, "Category 2: the max score of 20 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_3.each { |x| cntmax << x if x == "20"}
      if cntmax.length > 1
        errors.add(:base, "Category 3: the max score of 20 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_4.each { |x| cntmax << x if x == "20"}
      if cntmax.length > 1
        errors.add(:base, "Category 4: the max score of 20 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_5.each { |x| cntmax << x if x == "10"}
      if cntmax.length > 1
        errors.add(:base, "Category 5: the max score of 10 can only be assigned to one nominee.")
      end

      cntmax = []
      checker_6.each { |x| cntmax << x if x == "10"}
      if cntmax.length > 1
        errors.add(:base, "Category 6: the max score of 10 can only be assigned to one nominee.")
      end

    else
      true
    end
  end

  def score_1_no_multiple_9
    #puts "***HELLO***"
    #puts board.score_type_id
    #puts "***GOODBYE***"
    if board.score_type_id == 1
      cntnine = []
      checker_1.each { |x| cntnine << x if x == "9"}
      if cntnine.length > 1
        errors.add(:base, "Only one (1) nominee can be assigned a score of nine (9)")
      end
    else
      true # do your checking and return true or false
    end
  end

  def rank_only
    #puts "***HELLO***"
    #puts board.score_type_id
    #puts "***GOODBYE***"
    if board.score_type_id == 8

      dupes1 = checker_1.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 if !o.nil?}
      puts dupes1
      dupes = dupes1.map{|k,v| k if v >= 2}.compact
      puts dupes
      if not dupes.blank?
        errors.add(:base, "The same rank may not be applied to more than one nominee.   Please try again.")
      end
    else
      true # do your checking and return true or false
    end
  end

end
