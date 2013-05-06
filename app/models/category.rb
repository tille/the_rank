class Category < ActiveRecord::Base
  attr_accessible :contest_id, :name
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :contest_id, presence: true
  
  has_many :characters
  belongs_to :contest
end
