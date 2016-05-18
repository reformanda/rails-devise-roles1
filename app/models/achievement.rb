class Achievement < Nomination
  validates :submission_form, :presence => true
  validates :submission_form, :file_size => { less_than: 10.megabytes }

  validates :endorsement_letter, :presence => true
  validates :endorsement_letter, :file_size => { less_than: 10.megabytes }
end
