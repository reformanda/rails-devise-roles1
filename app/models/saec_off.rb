class SaecOff < Nomination
  validates :submission_form_award_narrative, :presence => true
  validates :submission_form_award_narrative, :file_size => { less_than: 10.megabytes }

  validates :endorsement_letter, :presence => true
  validates :endorsement_letter, :file_size => { less_than: 10.megabytes }

  validates :nominee_photograph_one, :presence => true
  validates :nominee_photograph_one, :file_size => { less_than: 10.megabytes },file_content_type: { allow: /^image\/.*/ }

  validates :nominee_photograph_two, :file_size => { less_than: 10.megabytes },file_content_type: { allow: /^image\/.*/ }

end
