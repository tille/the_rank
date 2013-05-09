class Vote < ActiveRecord::Base
  attr_accessible :contest_id, :character_id, :battle_id
  
  validate :uniqueness_of_user  
  validates_presence_of :contest_id, :character_id, :battle_id, :user_id, :ip
    
  [:battle, :contest, :character].each do |belongs_attr|
    belongs_to belongs_attr
  end
  
  def uniqueness_of_user
    votes_of_self_user = Vote.where(battle_id: self.battle_id, user_id: self.user_id)
    errors.add(:voter_id, "you already vote in this battle.") if votes_of_self_user.count >= 1
  end
  
end
