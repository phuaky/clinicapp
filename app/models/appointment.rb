class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :complaint
  belongs_to :day
  belongs_to :timeslot
end
