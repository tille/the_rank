class Vote < ActiveRecord::Base
  attr_accessible :contest_id, :character_id, :battle_id
  
  validate :uniqueness_of_user
  
  [:contest_id, :character_id, :battle_id, :user_id, :ip].each do |attr_req|
    validates attr_req, presence: true
  end
    
  [:battle, :contest, :character].each do |belongs_attr|
    belongs_to belongs_attr
  end
  
  def uniqueness_of_user
    votes_of_self_user = Vote.where(battle_id: self.battle_id, user_id: self.user_id)
    if votes_of_self_user.count >= 1
      errors.add(:voter_id, "you already vote in this battle.")
    end
  end
  
end
