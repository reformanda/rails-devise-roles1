class Board < ActiveRecord::Base
  serialize :users_list
  belongs_to :nomination_type
  belongs_to :score_type
  has_many :scores

  accepts_nested_attributes_for :score_type
end
