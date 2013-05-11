class Vote < ActiveRecord::Base
  attr_accessible :contest_id, :character_id, :battle_id, :user_id, :ip
  
  validate :uniqueness_of_user
  validates_presence_of :contest_id, :character_id, :battle_id, :user_id, :ip
  
  after_save :vote_increment
    
  [:battle, :contest, :character].each do |belongs_attr|
    belongs_to belongs_attr
  end
  
  def uniqueness_of_user
    votes_of_self_user = Vote.where(battle_id: self.battle_id, user_id: self.user_id)
    errors.add(:voter_id, "you already vote in this battle.") if votes_of_self_user.count >= 1
  end
  
  def vote_increment
    @battle = Battle.find( self.battle_id )
    @battle.increment(:total_votes).save

    if self.character_id == @battle.contester1
      @battle.increment(:votes_contester1).save
    else
      @battle.increment(:votes_contester2).save
    end
  end
end
