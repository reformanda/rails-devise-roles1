class AwardOption < ActiveRecord::Base
  belongs_to :nomination_type
  #belongs_to :nomination
end
