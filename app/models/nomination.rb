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
  validates :nominee_email, :email => true, :presence => true
  validates :nominee_organization, :nominee_command,
              :presence => true
  validates :submission_form, :presence => true
  validates :submission_form, :file_size => { less_than: 10.megabytes }

  validates :endorsement_letter, :presence => true
  validates :endorsement_letter, :file_size => { less_than: 10.megabytes }

  alias_attribute :nominee_organization_logo, :photo_a
  validates :nominee_organization_logo, :presence => true
  validates :nominee_organization_logo, :file_size => { less_than: 10.megabytes },file_content_type: { allow: /^image\/.*/ }



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

  #def self.name_search
  #  :nominee_last_name + :nominee_first_name
  #end

  paginates_per 25

  # note singular "validate" for custom function
  validate :nominee_name_or_team_name

  private

  def nominee_name_or_team_name
    if (nominee_first_name.blank? && nominee_last_name.blank? && nominee_team_name.blank?)
      errors.add(:base, 'Nominee Name or Nominee Team Name must be entered')
    end
  end


end
