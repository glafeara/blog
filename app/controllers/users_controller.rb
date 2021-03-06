class UsersController < ApplicationController

  before_action :signed,   except: [ :new, :create ]
  before_action :is_admin, only:   [ :index, :destroy, :activeadmin, :checked ]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    set_user
  end

  def update
    set_user.update(user_params)
    if @user.errors.empty?
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    set_user
    @user_articles = Article.where(user_id: set_user.id).map
    @user_comments = Comment.where(user_id: set_user.id).map
    @gravatar = Gravatar.new(set_user.email.downcase).image_url
  end

  def destroy
    set_user.destroy
    redirect_to users_path
  end

  def activeadmin
    set_user
    unless @user.isadmin
      @user.update_attribute(:isadmin, true)
      redirect_to users_path
    else
      @user.update_attribute(:isadmin, false)
      redirect_to users_path
    end
  end

  def checked
    set_user
    unless @user.checked
    @user.update_attribute(:checked, true)
      redirect_to users_path
    else
      @user.update_attribute(:checked, false)
      redirect_to users_path
    end
  end


  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
