class UsersController < ApplicationController
  # Disable CSRF protection for API endpoints
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, only: [:create, :update, :password]

  # Create a new user
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { message: "User created", user: @user }, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #create user along with password
  def full

  end

  def distroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: {error: "deleted successfully"}, status: :ok
    else
      render json: {error: "unable to delete"}, status: :processible_entity
  end
end

  # Update an existing user
  def update
    @user = User.find_by(id: params[:id])

    if @user.nil?
      render json: { error: "User not found" }, status: :not_found
    elsif @user.update(user_params)
      render json: { message: "Updated successfully", user: @user }, status: :ok
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # List all users
  def listing
    @users = User.all
    render json: @users
  end

  #adding password
 def password
  user = User.find_by(email: params[:user][:email])
  if user
    user.password = params[:user][:password]
    user.password_confirmation = params[:user][:password_confirmation] 
    if user.save
      render json: { message: "Password updated successfully" }, status: :ok
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  else
    render json: { error: "User not found" }, status: :not_found
  end
end 

  # Show a single user by ID
  def show
    @user = User.find_by(id: params[:id])

    if @user
      render json: @user
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :phn_number, :id_number, :password_digit , :password_confirmation)
  end
end
