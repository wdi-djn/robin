class Gift < ActiveRecord::Base
  belongs_to :user

  def active?
    if self.current_total >= self.price 
      self.active = false
      self.save
    end
  end

  has_many :contributions
  after_create :confirm_new_gift

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
  	:length => { maximum: 50 }

  validates :due_date,
    presence: true,
    date: { after: Proc.new { Date.today + 3},
                message: 'is too soon! Select a day at least 3 days from now' },
                on: :create

  validates :gift_url, 
    :allow_nil => true,
  	format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/ix, 
  			  message: "Please enter a valid URL" }
  

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
