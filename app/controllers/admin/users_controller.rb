class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all.order('id ASC')


  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @tasks = Task.order(:created_at).include(:user)
    @tasks = Task.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      if current_user.admin?
        redirect_to admin_user_path, notice:'user created successfully'
      else
        session[:user_id] = @user.id
          redirect_to tasks_path
        end
    else
      render.new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
        @admins = User.admin
      if @admins == 0
        redirect_to admin_users_path, notice: "Atleast one user or admin should remain"
  #prevent not to delete logged in user
      elsif @user.id == current_user.id
          redirect_to admin_users_path, notice: "Logged in user cannot be deleted!"
      else
  @user.destroy
  redirect_to admin_users_path, notice: 'User deleted.'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      if current_user.admin?
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    else
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    end
end
