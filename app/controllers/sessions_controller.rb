# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(uid: params[:email])
    return render json: { message: "Usuário não encontrado." }, status: :not_found unless user

    return render json: { email: user.email, token: user.authentication_token }, status: :ok if user.valid_password?(params[:password])

    return render json: { message: "senha inválida." }, status: :unauthorized
  end

  def destroy

  end
end
