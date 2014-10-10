class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = 'Рады Вас видеть снова!'
      redirect_to user
    else
      flash.now[:alert] = 'Неверный логин и/или пароль'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = 'Вы успешно вышли!'
    redirect_to root_path
  end

end
