class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :family_member
  has_one :family, through: :family_member
  has_many :events, through: :family_member

  def family_member?
    FamilyMember.find_by(user_id: id).present?
  end
end
