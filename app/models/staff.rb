class Staff < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  has_many :needs
  has_many :comments

  validates :role, :name, presence: true

  ROLE = %w|admin general|
end
