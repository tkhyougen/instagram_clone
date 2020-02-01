class FeedMailer < ApplicationMailer

  def feed_mail(feed)
    @feed = feed
    mail to: "illgalsubstance@yahoo.co.jp", subject:"投稿確認メール"
  end

end
