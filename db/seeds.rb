#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'csv'

Staff.find_or_create_by_name(name: 'admin', email: 'osaka@arc-academy.co.jp', password: 'passwordosaka', password_confirmation: 'passwordosaka')

staffs = CSV.open('db/staff_list.csv')
staffs.each do |staff|
  Staff.find_or_create_by_name(name: staff[0], email: staff[1], password: 'passwordosaka', password_confirmation: 'passwordosaka')
end

needs = CSV.open('db/osaka_requests.csv')
needs.each do |need|
  staff_id = Staff.where("name like ?", "%" + need[1] + "%").first.id
  created_need = Need.find_or_create_by_content(url: need[2], content: need[3], title: need[4], staff_id: staff_id)
  created_need.update_attributes(created_at: need[0])
end
