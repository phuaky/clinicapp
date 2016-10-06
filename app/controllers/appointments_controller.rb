class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    if @current_user.admin
      @appointments = Appointment.all
    elsif @current_user.patient
      @appointments = Appointment.where(patient_id: @current_user.patient.id)
    elsif @current_user.doctor
      puts "HEREHERE"
      @appointments = Appointment.where(doctor_id: @current_user.doctor.id)
    end



    # @patient = Patient.where(user_id: @current_user.id).take
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @doctors = Doctor.all
    @days = Day.all
    @timeslots = Timeslot.all
    @complaints = Complaint.all
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @doctors = Doctor.all
    @days = Day.all
    @timeslots = Timeslot.all
    @complaints = Complaint.all
    set_patient
    @appointment.patient_id = @patient.id
    puts "CHECKCHECK"
    puts @appointment.inspect

    if current_user
      respond_to do |format|
        if @appointment.save
          format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
          format.json { render :show, status: :created, location: @appointment }
        else
          format.html { render :new }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_patient
    @patient = Patient.where(user_id: @current_user.id).take
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :day_id, :timeslot_id, :complaint_id)
  end
end
