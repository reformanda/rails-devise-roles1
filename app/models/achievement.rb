class Achievement < Nomination
  alias_attribute :nominee_organizational_logo, :photo_a
  validates :nominee_organizational_logo, :presence => true
end
