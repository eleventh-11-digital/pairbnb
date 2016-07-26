# Preview all emails at http://localhost:3000/rails/mailers/sender_mailer
class UserMailerPreview < ActionMailer::Preview

	def sample_mailer_preview
		UserMailer.sample_email(User.first)
	end

end