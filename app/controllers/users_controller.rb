class UsersController < ApplicationController
  before_action :is_admin, only: [:index, :new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @user = User.where(:id => @current_user.id)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @patient = Patient.new
  end

  # GET /users/1/edit
  def edit
    set_user
    set_patient
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @patient = Patient.new(patient_params)

      if @user.save
        @patient.user_id = @user.id
        if @patient.save
          redirect_to '/', notice: 'User and Patient was successfully created.'
        else
          render :new
        end
      else
        render :new
      end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    set_user
    set_patient
    if @user.update(params.require(:user).permit(:email))
      if @patient.update(patient_params)
        redirect_to "/users/#{@current_user.id}", notice: 'User and Patient was successfully updated.'
      else
        render :edit
      end
    else
      render :edit
    end

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    @patient.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_patient
      @patient = Patient.where(user_id: @current_user.id).take
    end

    # def current_patient
    #   @patient ||= Patient.find_by_id(session[:user_id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def patient_params
      params.require(:patient).permit(:name, :allergy)
    end
end
