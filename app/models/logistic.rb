class Logistic < Nomination
  validates :submission_form_award_narrative, :presence => true
  validates :submission_form_award_narrative, :file_size => { less_than: 10.megabytes }

  validates :submission_pdf, :presence => true
  validates :submission_pdf, :file_size => { less_than: 10.megabytes }
end
