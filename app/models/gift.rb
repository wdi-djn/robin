class Gift < ActiveRecord::Base
  belongs_to :user

  def self.complete? 
    p "THIS IS A CRON JOB!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  end

end
