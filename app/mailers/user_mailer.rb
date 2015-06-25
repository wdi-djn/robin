class UserMailer < ApplicationMailer
	
	default from: "hippowhobringsgifts@gmail.com"

	def new_user_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to hell!')
	end
end
