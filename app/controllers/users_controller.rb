class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index

    @users = User.all
    @users = User.where("name like ? or email like ?","%#{params[:search]}%","%#{params[:search]}%") unless params[:search].blank?
    @users = @users.admin if params[:role] == "admin"
    @users = @users.judge if params[:role] == "judge"
    @users = @users.manager if params[:role] == "manager"
    @users = @users.order(:name).page params[:page] #User.all

  end

  def edit
    @nomination_types = NominationType.all.pluck(:code,:id)

  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to action: "index", :alert => "Access denied."
      end
    end
  end

  def new
    @user = User.new
    @password = new_password

  end

  def create
    @user = User.new(secure_params)

    # create a password
    #@password = new_password

    @user.password = params[:entered_password]
    @user.password_confirmation = params[:entered_password_confirmation]

    respond_to do |format|
      if @user.save

        UserMailer.account_creation(@user, params[:entered_password]).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def new_password
    Devise.friendly_token.first(8)
  end

  def admin_only
    unless current_user.admin?
      redirect_to :root, :alert => "Access denied."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:role,:name,:email,:nomination_types_list => [])
  end

end
