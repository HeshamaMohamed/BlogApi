class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.create(sign_up_params)

    if user.save
      render json: { token: JsonWebToken.encode(id: user.id) }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.permit(:name, :email, :password, :image)
  end
end
