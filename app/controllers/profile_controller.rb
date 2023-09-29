class ProfileController < ApplicationController
  def show
    current_user = User.create_anonymous_user

    render json: { user: current_user, auth_token: JsonWebToken.encode(user_id: current_user.id)  }
  end
end