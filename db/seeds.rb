# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by!(email: 'admin@a.com') do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

Admin.find_or_create_by!(user_id: user.id) do |admin|
  admin.name =  'Admin User'
end

user = User.find_or_create_by!(email: 'doctorjones@gmail.com') do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

doctor_jones = Doctor.find_or_create_by!(user_id: user.id) do |doctor|
  doctor.name =  'Doctor Jones'
end

user = User.find_or_create_by!(email: 'doctorvictor@gmail.com') do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

doctor_victor = Doctor.find_or_create_by!(user_id: user.id) do |doctor|
  doctor.name =  'Doctor Victor'
end

user = User.find_or_create_by!(email: 'tom@gmail.com') do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

tom = Patient.find_or_create_by!(user_id: user.id) do |patient|
  patient.name =  'Tom'
  patient.allergy = 'Nuts'
end

user = User.find_or_create_by!(email: 'dick@gmail.com') do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

dick = Patient.find_or_create_by!(user_id: user.id) do |patient|
  patient.name =  'Dick'
  patient.allergy = 'Honey'
end

user = User.find_or_create_by!(email: 'harry@gmail.com') do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

harry = Patient.find_or_create_by!(user_id: user.id) do |patient|
  patient.name =  'Harry'
  patient.allergy = 'Pollen'
end

for i in 6..20 do
  string = i.to_s + '/10/16'
  Day.find_or_create_by!(date: string)
end

for i in 9..16 do
  string = i.to_s + ':00 to ' + (i+1).to_s + ':00'
  Timeslot.find_or_create_by!(timeslot: string)
end

complaints = ['Cough', 'Fever', 'Flu', 'Headache', 'Vomit', 'Diarrhoea', 'Keng']
complaints.each do |x|
  Complaint.find_or_create_by!(complaint: x)
end

Appointment.find_or_create_by!(doctor_id: doctor_jones.id, day_id: 1, timeslot_id: 1) do |appointment|
  appointment.patient_id = tom.id
  appointment.doctor_id = doctor_jones.id
  appointment.day_id = 1
  appointment.timeslot_id = 1
  appointment.complaint_id = 1
end

Appointment.find_or_create_by!(doctor_id: doctor_jones.id, day_id: 1, timeslot_id: 1) do |appointment|
  appointment.patient_id = dick.id
  appointment.doctor_id = doctor_jones.id
  appointment.day_id = 1
  appointment.timeslot_id = 1
  appointment.complaint_id = 1
end

puts "Finished DB seeding."
