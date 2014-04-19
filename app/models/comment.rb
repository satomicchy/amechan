class Comment < ActiveRecord::Base
  belongs_to :need
  belongs_to :staff
end
