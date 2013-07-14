class Answer < ActiveRecord::Base
  belongs_to :need, touch: true
end
