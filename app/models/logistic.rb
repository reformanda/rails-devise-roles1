class Logistic < Nomination
  validates :submission_word_document, :presence => true
  validates :submission_word_document, :file_size => { less_than: 10.megabytes }

  validates :submission_pdf, :presence => true
  validates :submission_pdf, :file_size => { less_than: 10.megabytes }
end
