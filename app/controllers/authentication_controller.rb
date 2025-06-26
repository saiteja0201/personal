class AuthenticationController < ApplicationController
    skip_before_action :verify_authenticity_token

  #SECRET_KEY = Rails.application.secret_key_base

  def login
  
    user=User.find_by(email: params[:email])
      
    if user.present? && user.authenticate(params[:password])
      payload={user_id: user.id ,exp:1.hour.from_now.to_i}
        token= JWT.encode(payload,JWT_PRIVATE_KEY, 'RS256')
        Rails.logger.info "token: #{token}"
        render json: {token: token}
    else
        render json:{error: " invalid user and password"}, status: :unathorized
    end
  end
end
