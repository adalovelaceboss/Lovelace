class ApplicationController < ActionController::Base
  include Stormpath::Rails::Controller
  protect_from_forgery with: :exception

  def set_search
   @search_adie = Adie.search(params[:q])
   @search_company = Company.search(params[:q])
  #  @search_staff = Staff.search(params[:q])
  end
end
