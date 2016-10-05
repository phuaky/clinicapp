class Doctor < ApplicationRecord
  has_one :specialty
  has_many :appointments
end
