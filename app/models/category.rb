class Category < ActiveRecord::Base
  attr_accessible :contest_id, :name
  
  has_many :characters
end
