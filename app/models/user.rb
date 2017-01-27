class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :resumes

  before_create :build_profile

  def admin?
    is_admin
  end
end
