class Gift < ActiveRecord::Base
  belongs_to :user

  def active?
    if Date.new >= self.due_date 
      self.active = false
      self.save
      GiftMailer.gift_funded_email(self).deliver
    end
  end

  has_many :contributions
  after_create :confirm_new_gift

  validates :title, 
  	presence: true,
  	:length => { minimum: 3, maximum: 100 }
 
  validates :description, 
  	presence: true,
  	:length => { minimum: 3, maximum: 1000 }
  
  validates :price,
  	presence: true,
  	numericality: true
  
  validates :recipient, 
  	presence: true,
  	:length => { maximum: 50 }

  validates :due_date,
    presence: true,
    date: { after: Proc.new { Date.today + 3},
                message: 'is too soon! Select a day at least 4 days from now' },
                on: :create

  validates :gift_url, 
    :allow_blank => true,
  	format: { with: URI.regexp, 
  			  message: "is not valid, please enter the full link" }
  

  def confirm_new_gift
    GiftMailer.new_gift_email(self).deliver
    puts "//////////"
    puts "//////////"
    puts "//////////"
    puts "//////////"
    puts "//////////"
    puts "//////////"
    puts "NEW GIFT EMAIL SENT!"
  end

end
