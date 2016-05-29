class Decp < Nomination

  validates :submission_form_award_narrative, :presence => true
  validates :submission_form_award_narrative, :file_size => { less_than: 10.megabytes }

  validates :endorsement_letter, :presence => true
  validates :endorsement_letter, :file_size => { less_than: 10.megabytes }

end
