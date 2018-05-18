require 'valid_email'
class Nomination < ActiveRecord::Base
  mount_uploader :endorsement_letter, EndorsementLetterUploader
  mount_uploader :submission_form_award_narrative, SubmissionFormAwardNarrativeUploader
  mount_uploader :nominee_organization_logo, NomineeOrganizationLogoUploader
  mount_uploader :submission_word_document, SubmissionWordDocumentUploader
  mount_uploader :submission_pdf, SubmissionPdfUploader
  mount_uploader :submission_packet, SubmissionPacketUploader
  mount_uploader :nominee_photograph_one, NomineePhotographOneUploader
  mount_uploader :nominee_photograph_two, NomineePhotographTwoUploader
  mount_uploader :additional_supporting_graphics, AdditionalSupportingGraphicsUploader
  mount_uploader :monetary_awd, MonetaryAwdUploader

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






  #validates :photo_a, :presence => true
  validates :nominating_point_of_contact_email, :presence => true, :email => true

  enum status: [:entered, :approved, :scored, :deleted]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :entered
  end

  def self.nomination_types
    %w(Packard Should Achievement Development ProductSupport Logistic Asp Battalion Bop Brigade Cp Decp Esi Loy Nco Pmpdo05 Pmpdo06 Pmpdp05 Pmpdp06 Stp SaecTeam SaecOff SaecSpec)
  end

  #def self.name_search
  #  :nominee_last_name + :nominee_first_name
  #end

  #paginates_per 1000

  # note singular "validate" for custom function
  validate :nominee_name_or_team_name

  attr_reader :name

  def name
    if (nominee_first_name.blank? && nominee_last_name.blank?)
      nominee_team_name
    else
      nominee_first_name + " " + nominee_last_name
    end
  end

  private

  def nominee_name_or_team_name
    if (nominee_first_name.blank? && nominee_last_name.blank? && nominee_team_name.blank?)
      errors.add(:base, 'Nominee Name or Nominee Team Name must be entered')
    end
  end


end
