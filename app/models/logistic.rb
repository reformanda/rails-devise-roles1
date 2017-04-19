class Logistic < Nomination
  validates :submission_word_document, :presence => true
  validates :submission_word_document, :file_size => { less_than: 10.megabytes }

  validates :endorsement_letter, :presence => true
  validates :endorsement_letter, :file_size => { less_than: 10.megabytes }

end
