class User < ActiveRecord::Base
  enum role: [:judge, :manager, :admin]
  after_initialize :set_default_role, :if => :new_record?


  def set_default_role
    self.role ||= :judge
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


  #paginates_per 25



  #scope :starts_with, -> (name) { where("name like ?", "#{name}%")}

end
