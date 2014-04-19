class Need < ActiveRecord::Base
  belongs_to :staff
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy

  STATE      = ["waiting", "on_handling", "on_hold", "resolved", "rejection"]
  IMPORTANCE = ["low_level", "middle_level", "high_level"]
end
