class Nomination < ActiveRecord::Base
  mount_uploader :endorsement_letter, EndorsementLetterUploader
  mount_uploader :submission_form, SubmissionFormUploader
  mount_uploader :photo_a, PhotoAUploader
  mount_uploader :photo_b, PhotoBUploader


  validates :ucho_first, :ucho_last, :ucho_email, :presence => true

  def self.nomination_types
    %w(Packard)
  end
end
