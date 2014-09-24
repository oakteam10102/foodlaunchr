class User < ActiveRecord::Base
    belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "User", :foreign_key => "referrer_id"

    attr_accessible :email

    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." }
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code
    after_create :send_welcome_email

    REFERRAL_STEPS = [
        {
            'count' => 5,
            "html" => "50% OFF <br> 1st Month Subscription on Signup",
            "class" => "two",
            "image" =>  "http://thesavorychronicles.files.wordpress.com/2013/05/vertical.jpg"
        },
        {
            'count' => 10,
            "html" => "1 Free Meal <br> on Signup",
            "class" => "three",
            "image" => "http://24.media.tumblr.com/tumblr_mck8eqJ2101rcjq6vo1_500.png"
        },
        {
            'count' => 25,
            "html" => "2 Free Meals <br> on Signup",
            "class" => "four",
            "image" => "http://24.media.tumblr.com/tumblr_m98h8bHn751rcjq6vo1_250.png"
        },
        {
            'count' => 50,
            "html" => "1 Month of Free Meals <br> on Signup",
            "class" => "five",
            "image" => "http://thumbs.dreamstime.com/z/cooked-crabs-food-8471152.jpg"
        }
    ]

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = User.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = User.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end

    def send_welcome_email
        UserMailer.delay.signup_email(self)
    end
end
