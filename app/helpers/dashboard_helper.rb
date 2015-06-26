module DashboardHelper
  def all_paid?(gift)
    gift.contributions.each do |contribution|
      if contribution.paid == false
        return false
      end
    end
    return true
  end
end
