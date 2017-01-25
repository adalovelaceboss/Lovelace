class ApplicationController < ActionController::Base
  include Stormpath::Rails::Controller
  protect_from_forgery with: :exception
  before_filter :redirect_https

  def redirect_https
    redirect_to protocol: "https://" unless request.ssl?
    return true
  end

  def set_search
   @search_adie = Adie.search(params[:q])
   @search_company = Company.search(params[:q])
   @search_employee = Employee.search(params[:q])
  end

  # def require_login
  #   byebug
  #   require_authentication!
  # end

  def signed_in?
    return false if ! current_account.present?
    adie = Adie.find_by(github_username: current_account.username)
    domain = "@adadevelopersacademy.org"
    staff = Employee.where("email like ?", "%#{domain}")

    if adie.nil? || staff.nil?
      flash[:notice] = "You are not in the database and cannot log in. Please contact an administrator at info@adadevelopersacademy.org!"
    end

    if adie.present? || staff.present?
      return true
    end

  end

end
