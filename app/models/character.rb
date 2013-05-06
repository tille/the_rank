class Character < ActiveRecord::Base
  attr_accessible :name, :category_id
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :category_id, presence: true
  
  belongs_to :category
  has_many :battles
  has_many :votes

  def battles
    num = Battle.where( contester1: self.id ) + Battle.where( contester2: self.id )
    num.count
  end
  
end
