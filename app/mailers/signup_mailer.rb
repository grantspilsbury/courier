class SignupMailer < ActionMailer::Base
    def sign_up(user)
        @user = user
        mail(from: "hello@mentionengine.com", to: @user.email, bcc: "grant@contracta.co.za", subject: "Welcome to Mention Engine")
    end

end