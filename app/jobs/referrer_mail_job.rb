class ReferrerMailJob
  include SuckerPunch::Job 

  def perform(id)
    user = User.find(id)
    user.send_email_to_referrer
  end

  def later(sec, id)
    after(sec) { perform(id) }
  end
end
