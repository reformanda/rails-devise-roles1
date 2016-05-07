class NominationType < ActiveRecord::Base
  mount_uploader :awards_announcement, AwardsAnnouncementUploader
  mount_uploader :implementing_instructions, ImplementingInstructionsUploader
  mount_uploader :submission_form, SubmissionFormUploader
  mount_uploader :award_narrative, AwardNarrativeUploader
  mount_uploader :guidelines, GuidelinesUploader
  has_many :award_options
end
