class UserNotifier < ActionMailer::Base
  default :from => 'welcome@ublank.io'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
  	@user = user
    mail( :to => user.email,
    :subject => 'BlankU for signing up to UBlank.' )
  end
end