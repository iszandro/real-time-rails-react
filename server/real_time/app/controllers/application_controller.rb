class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  private

  # For all responses in this controller, return the CORS access control headers.

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin']  = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age']       = '1728000'
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers

  def cors_preflight_check
    headers['Access-Control-Allow-Origin']  = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT, DELETE'
    headers['Access-Control-Allow-Headers'] = 'Content-Type, X-Requested-With, X-Prototype-Version, X-CSRF-Token'
    headers['Access-Control-Max-Age']       = '1728000'
  end
end
