class Doctor < ApplicationRecord
  has_one :specialty
  belongs_to :user
  has_many :appointments
end
