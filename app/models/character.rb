class Character < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, presence: true, uniqueness: true
  
  belongs_to :category
end
