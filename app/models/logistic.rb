class Logistic < Nomination
  validates :submission_word_document, :presence => true
  validates :submission_word_document, :file_size => { less_than: 10.megabytes }

  validates :submission_pdf, :presence => true
  validates :submission_pdf, :file_size => { less_than: 10.megabytes }
  #alias_attribute :nominee_organization_logo, :photo_a
  
  validates :nominee_organization_logo, :presence => true
  validates :nominee_organization_logo, :file_size => { less_than: 10.megabytes },file_content_type: { allow: /^image\/.*/ }
end
