class UserMailer < ApplicationMailer

	def new_user_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to hell!')
	end
end
