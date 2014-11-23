class WelcomeMailJob
  include SuckerPunch::Job 

  def perform(id)
    user = User.find(id)
    user.send_welcome_email
  end

  def later(sec, id)
    after(sec) { perform(id) }
  end
end