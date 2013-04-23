class Vote < ActiveRecord::Base
  attr_accessible :contest_id, :character_id
  
  validates :contest_id, presence: true
  validates :character_id, presence: true
  
  belongs_to :contest
  belongs_to :character
end
