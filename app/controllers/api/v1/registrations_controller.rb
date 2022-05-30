class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.create(sign_up_params)

    if user.save
      render json: { token: JsonWebToken.encode(id: user.id) }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :image)
  end
end
