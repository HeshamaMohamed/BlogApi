class Api::V1::SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(sign_in_params[:email])
    if user&.valid_password?(sign_in_params[:password])
      render json: { token: JsonWebToken.encode(id: user.id) }
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def sign_in_params
    params.require(:user).permit(:name, :email, :password, :image)
  end
end
