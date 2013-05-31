class Character < ActiveRecord::Base
  attr_accessible :name, :category_id, :image
    
  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :category_id, presence: true
  validates :image, presence: true
  
  belongs_to :category
  has_many :battles
  has_many :votes

  has_attached_file :image,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  def battles
    Battle.where("contester1 == ? or contester2 == ?", self.id, self.id).count
  end
end
