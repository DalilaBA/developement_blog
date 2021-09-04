class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def show
    # @user.avatar.attach(params[:avatar])
    # byebug
    # @articles = @user.articles
    @articles = @user.articles.paginate(page: params[:page], per_page: 3)
  end
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def create
    # byebug
    @user = User.new(user_params)
    # @user.avatar.attach(params[:avatar])

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] ="Welcom #{@user.username} to the Developement blog, you have successfully sign up"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    

  end

  def update
    # @user.avatar.attach(params[:avatar])
    # byebug
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfuly updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
