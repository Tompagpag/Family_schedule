class FamilyMember < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :family
  has_many :events

  before_save :associate_user

  def associate_user
    self.user = User.find_by(email: email) if email.present?
  end
end
