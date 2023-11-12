class Api::V1::UsersController < ApplicationController


  private

  def user_params
    params.permit(:username, :email, :password)
  end
end