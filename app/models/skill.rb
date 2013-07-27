class Skill < ActiveRecord::Base
  has_many :proficiencies
  has_many :users, :through => :proficiencies

  
  validates :name, uniqueness: true
  
  def  user_with_proficiency(level)
    User.find(Proficiency.where(:level == level, :skill_id == self.id).first.user_id)
  end
end
