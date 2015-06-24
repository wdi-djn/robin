class Gift < ActiveRecord::Base
  belongs_to :user
  has_many :contributions

  validates :title, 
  	presence: true,
  	:length => { minimum: 5, maximum: 100 }
 
  validates :description, 
  	presence: true,
  	:length => { minimum: 5, maximum: 1000 }
  
  validates :price,
  	presence: true,
  	numericality: true
  
  validates :recipient, 
  	presence: true,
  	:length => { maximum: 20 }

  validates :gift_url, 
  	format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/ix, 
  			  message: "Please enter a valid URL" }
  

end
