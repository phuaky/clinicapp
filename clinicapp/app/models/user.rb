class User < ApplicationRecord
  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :password,
  confirmation: true,
  length: { in: 8..72 },
  on: :create

  validates :password_confirmation,
  length: { in: 8..72 },
  presence: true,
  on: :create

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
