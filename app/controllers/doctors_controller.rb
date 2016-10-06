class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @doctor = Doctor.find(params[:id])
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
    @patients = Patient.all
    @doctors = Doctor.all
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
  end

  # POST /doctors
  # POST /doctors.json
  def create
    if params[:type] == 'doctor'
      @doctor = Doctor.new(params.permit(:user_id, :name))
      @doctor.save
      @patient = Patient.where(user_id: @doctor.user_id).take
      @patient.destroy
      redirect_to '/doctors/new'
    elsif params[:type] = 'patient'
      @patient = Patient.new(params.permit(:user_id, :name))
      @patient.save
      @doctor = Doctor.where(user_id: @patient.user_id).take
      @doctor.destroy
      redirect_to '/doctors/new'
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.where(user_id: @current_user.id).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:user_id, :name, :specialty_id)
    end
end
