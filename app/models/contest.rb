class Contest < ActiveRecord::Base
  attr_accessible :name

  has_one :category
  has_many :votes
end
