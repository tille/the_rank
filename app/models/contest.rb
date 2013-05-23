class Contest < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }

  has_one :category
  has_many :battles, through: :category
  has_many :votes  
end
