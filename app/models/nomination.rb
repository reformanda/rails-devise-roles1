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
  validate :nominee_name_or_team_name
  validates :nominee_email, :nominee_organization, :nominee_command,
              :presence => true
  validates :submission_form, :endorsement_letter, :presence => true



  #validates :photo_a, :presence => true
  validates :nominating_point_of_contact_email, :presence => true, :email => true

  enum status: [:entered, :approved, :scored]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :entered
  end

  def self.nomination_types
    %w(Packard Should Achievement Development ProductSupport Logistic)
  end

  paginates_per 25


  private

  def nominee_name_or_team_name
    if (nominee_first_name.blank? && nominee_last_name.blank? && nominee_team_name.blank?)
      errors.add(:base, 'Nominee Name or Nominee Team Name must be entered')
    end
  end


end
