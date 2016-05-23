class Board < ActiveRecord::Base
  serialize :users_list
  belongs_to :nomination_type
end
