require 'valid_email'
class Nomination < ActiveRecord::Base
  mount_uploader :endorsement_letter, EndorsementLetterUploader
  mount_uploader :submission_form, SubmissionFormUploader
  mount_uploader :photo_a, PhotoAUploader
  mount_uploader :photo_b, PhotoBUploader

  belongs_to :nomination_type
  belongs_to :award_option

  validates :unit_commander_first_name, :unit_commander_last_name,  :unit_commander_phone,:unit_commander_email, :unit_commander_organization, :presence => true
  validates :nominating_point_of_contact_first_name, :nominating_point_of_contact_last_name, :nominating_point_of_contact_email,
            :nominating_point_of_contact_phone, :nominating_point_of_contact_organization_address_1, :nominating_point_of_contact_city,
              :presence => true
  validates :award_option_id, :presence => true
  validates :nominee_first_name, :nominee_last_name, :nominee_email, :nominee_organization, :nominee_command,
              :presence => true
  validates :submission_form, :endorsement_letter, :presence => true



  #validates :photo_a, :presence => true
  validates :nominating_point_of_contact_email, :presence => true, :email => true

  def self.nomination_types
    %w(Packard Should Achievement Development ProductSupport Logistic)
  end

  paginates_per 25
  
end
