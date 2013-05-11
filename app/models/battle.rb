class Battle < ActiveRecord::Base
  attr_accessible :contester1, :contester2, :total_votes, :votes_contester1, :votes_contester2, :category_id
  
  [:contester1, :contester2, :total_votes, :votes_contester1, :votes_contester2].each do |attr_req|
    validates attr_req, presence: true    
  end

  has_many :votes
  #belongs_to :character, :class_name => "Character", :foreign_key => "character_id"    

  def winner
    if self.votes_contester1 > self.votes_contester2
      Character.find(self.contester1).name
    elsif self.votes_contester2 > self.votes_contester1
      Character.find(self.contester2).name
    else
      "Draw"
    end
  end
end
