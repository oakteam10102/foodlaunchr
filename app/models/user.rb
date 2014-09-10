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
            "html" => "50% OFF <br> 1 First Week's Subscription",
            "class" => "two",
            "image" =>  "http://s4.favim.com/orig/50/club-delicious-food-lunch-sanwich-Favim.com-460453.jpg"
        },
        {
            'count' => 10,
            "html" => "Free Meal <br> A Free Meal Valued at $15",
            "class" => "three",
            "image" => "http://www.abc.net.au/news/image/853746-3x2-940x627.jpg"
        },
        {
            'count' => 25,
            "html" => "2 Weeks <br> 2 Weeks of Free FoodGem Meals",
            "class" => "four",
            "image" => "http://1.bp.blogspot.com/_0DNo0eySp-8/TSL7oN98tFI/AAAAAAAAAQE/6Y6M6fvxXqM/s400/sushi-india-japanese-cuisine.jpg"
        },
        {
            'count' => 50,
            "html" => "Free Month <br> Month of Free FoodGem Meals",
            "class" => "five",
            "image" => "http://ouritaliantable.com/wp-content/uploads/2010/06/crabmeat-pasta.jpg"
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
