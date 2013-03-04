class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :show]
  
  def index
    @users = User.all
    
    respond_to do |format|
      format.html
      format.json { render json: @users }
      format.xml { render xml: @user }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Admin App"                        
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    puts params[:user].inspect
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_path, :notice => "User was successfully updated") }
        format.json { respond_with_bip(@user) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@user) }
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
      format.xml { head :ok }
    end
  end
  
  private
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in" unless signed_in?
    end
  
end
