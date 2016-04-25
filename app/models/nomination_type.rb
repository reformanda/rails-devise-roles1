class NominationType < ActiveRecord::Base
  #has_many :nominations
  mount_uploader :awards_announcement, AwardsAnnouncementUploader
  mount_uploader :implementing_instructions, ImplementingInstructionsUploader
  mount_uploader :submission_form_and_award_narrative, SubmissionFormUploader
  mount_uploader :award_narrative_sample, AwardNarrativeUploader
  mount_uploader :guidelines_and_tips, GuidelinesUploader

end
