class GiftMailer < ApplicationMailer

	def new_gift_email(gift)
		@gift = gift
		mail(to: @gift.user.email, subject: "New gift created: "+ @gift.title)
	end

	def gift_funded_email(fundedgift)
		@gift = fundedgift
		mail(to: @gift.user.email, subject: @gift.title+" is funded!")
	end
end
