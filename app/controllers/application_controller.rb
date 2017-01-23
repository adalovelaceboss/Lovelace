class ApplicationController < ActionController::Base
  include Stormpath::Rails::Controller
  protect_from_forgery with: :exception

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
    # domain = "@adadevelopersacademy.org"
    # staff = Employee.where("email like ?", "%#{domain}")

    flash[:notice] = "You are not in the database and cannot log in. Please contact an administrator at info@adadevelopersacademy.org!" if adie.nil?
    # || if staff.nil?

    return adie.present?

  end

end
