class Vote < ActiveRecord::Base
  attr_accessible :contest_id, :character_id
  
  belongs_to :contest
  belongs_to :character
end
