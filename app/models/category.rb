class Category < ActiveRecord::Base
  attr_accessible :contest_id, :name
  
  validates :name, presence: true, uniqueness: true
  validates :contest_id, presence: true
  
  has_many :characters
end
