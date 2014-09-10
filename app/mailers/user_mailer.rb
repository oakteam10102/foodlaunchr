class UserMailer < ActionMailer::Base
    default from: "FoodGem <john@foodgem.com>"

    def signup_email(user)
        @user = user
        @twitter_message = "#Food is evolving. Excited for foodgem.com to launch."

        mail(:to => user.email, :subject => "Thanks for signing up!")
    end
end
