class Board < ActiveRecord::Base
  serialize :users_list
  belongs_to :nomination_type
  has_many :score_types
  has_many :scores
end
