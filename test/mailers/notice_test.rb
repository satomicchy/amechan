# -*- coding: utf-8 -*-
require 'test_helper'

class NoticeTest < ActionMailer::TestCase
  test "update" do
    mail = Notice.update
    assert_equal "Amechan box更新のお知らせ。", mail.subject
    assert_equal ["one@example.com", "two@example.com", "admin@example.com"], mail.to
    assert_equal ["amechan_box_no_reply@example.com"], mail.from
  end
end
