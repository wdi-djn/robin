class GiftMailer < ApplicationMailer

	def new_gift_email(gift)
		@gift = gift
		mail(to: @gift.user.email, subject: @gift.title)
	end
end
