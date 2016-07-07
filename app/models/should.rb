class Should < Nomination

  validates :submission_form_award_narrative, :presence => true
  validates :submission_form_award_narrative, :file_size => { less_than: 10.megabytes }

  validates :endorsement_letter, :presence => true
  validates :endorsement_letter, :file_size => { less_than: 10.megabytes }

  #alias_attribute :nominee_organization_logo, :photo_a
  validates :nominee_organization_logo, :presence => true
  validates :nominee_organization_logo, :file_size => { less_than: 10.megabytes },file_content_type: { allow: /^image\/.*/ }
end
