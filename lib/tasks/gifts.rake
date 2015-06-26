namespace :gifts do
  
  desc "Checks and sets gifts active value"
  task check_active: :environment do
    Gift.all.each do |gift|
      if Date.new >= gift.due_date 
        gift.active = false
        gift.save
      end
    end
  end

end
