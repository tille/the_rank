class Battle < ActiveRecord::Base
  attr_accessible :contester1, :contester2, :total_votes, :votes_contester1, :votes_contester2
  
  # belongs_to :character, :class_name => "Character", :foreign_key => "character_id"    
end
