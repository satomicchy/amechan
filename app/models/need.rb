class Need < ActiveRecord::Base
  belongs_to :staff
  has_many :answers
end
