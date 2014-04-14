# -*- coding: utf-8 -*-
class Notice < ActionMailer::Base
  default from: "amechan_box_no_reply@example.com"

  def self.run
    @needs = Need.where(updated_at: (time_now - 1.day)..time_now)
    if @needs.present?
      Notice.update.deliver
    end
  end

  def update
    time_now = Time.now
    @needs = Need.where(updated_at: (time_now - 1.day)..time_now)

    mail to: Staff.pluck(:email), subject: "Amechan box更新のお知らせ。"
  end
end
