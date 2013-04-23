class Contest < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  has_one :category
  has_many :votes
end
