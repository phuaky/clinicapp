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
    @doctors = Doctor.all
    @days = Day.all
    @timeslots = Timeslot.all
    @complaints = Complaint.all
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

    if current_user
        if @appointment.save
          flash[:success] = 'Appointment was successfully created.'
          redirect_to @appointment
        else
          format.html { render :new }
        end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    if @appointment.update(appointment_params)
      flash[:success] = 'Appointment was successfully updated.'
      redirect_to @appointment
    else
      format.html { render :edit }
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
