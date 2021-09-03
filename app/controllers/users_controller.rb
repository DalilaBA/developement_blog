class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # @user.avatar.attach(params[:avatar])
    # byebug
    @articles = @user.articles
  end
  def index
    @users = User.all
  end

  def create
    # byebug
    @user = User.new(user_params)
    @user.avatar.attach(params[:avatar])

    if @user.save
      flash[:notice] ="Welcom #{@user.username} to the Developement blog, you have successfully sign up"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    

  end

  def update
    @user = User.find(params[:id])
    @user.avatar.attach(params[:avatar])
    byebug
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfuly updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end
end
