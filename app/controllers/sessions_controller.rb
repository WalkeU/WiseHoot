class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash[:alert] = "Incorrect username or password."
      respond_to do |format|
        format.html do
          @login_error = "Incorrect username or password."
          render partial: "sessions/login_form", locals: { error: @login_error }, status: :unprocessable_entity
        end
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "login-form",
            partial: "sessions/login_form",
            locals: { error: "Incorrect username or password." }
          )
        end
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  def register
    @user = User.new
  end

  def create_user
    @user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Registered and logged in!"
    else
      respond_to do |format|
        format.html do
          @register_error = @user.errors.full_messages.join(", ")
          render partial: "sessions/register_form", locals: { error: @register_error }, status: :unprocessable_entity
        end
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "register-form",
            partial: "sessions/register_form",
            locals: { error: @user.errors.full_messages.join(", ") }
          )
        end
      end
    end
  end
end
