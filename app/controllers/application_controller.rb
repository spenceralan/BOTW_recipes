class ApplicationController < ActionController::API
  before_action :authenticate
  include Response
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :unprocessable_entity)
  end
private
  def authenticate
    head :unauthorized unless User.exists?(token: params[:token])
  end
end
