class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
#for admin page
  before_action :ensure_admin_user!
def ensure_admin_user!
unless current_user and current_user.adminb?
 redirect_to root_path, notice:"you don't belong there <<you are not admin>>"
end
end
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @tasks = Task.all

  end

  # GET /users/1
  # GET /users/1.json
  def show
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

    respond_to do |format|
      if @user.save
        session[:user_id]= @user.id
        format.html { redirect_to admin_users_path(@user.id), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: admin_users_path(@user.id) }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
       if @user.id == current_user.id
         redirect_to admin_users_path, notice: "You can not delete signed in user"
         @adminu = User.adminu
       elsif @adminu == 1
         redirect_to admin_users_path, notice: "At least one admin must remain!"
       else
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :adminb)
    end
end