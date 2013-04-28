class Character < ActiveRecord::Base
  attr_accessible :name, :category_id
  
  validates :name, presence: true, uniqueness: true
  
  belongs_to :category
end
