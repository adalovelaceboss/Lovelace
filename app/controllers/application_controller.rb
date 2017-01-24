class ApplicationController < ActionController::Base
  include Stormpath::Rails::Controller
  protect_from_forgery with: :exception
  before_filter :redirect_https

  def redirect_https
    redirect_to protocol: "https://" unless request.ssl?
    return true
  end
  # must be off while in development

  def set_search
   @search_adie = Adie.search(params[:q])
   @search_company = Company.search(params[:q])
  #  @search_staff = Staff.search(params[:q])
  end

  # def require_login
  #   byebug
  #   require_authentication!
  # end

  def signed_in?
    return false if ! current_account.present?
    adie = Adie.find_by(github_username: current_account.username)

    flash[:error] = "You are not in the database and cannot log in. Please contact an administrator at info@adadevelopersacademy.org!" if adie.nil?

    return adie.present?

  end

end
