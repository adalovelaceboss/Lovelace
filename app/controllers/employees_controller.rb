class EmployeesController < ApplicationController
  # before_action :require_authentication!
  before_action :find_employee, only: [:show, :edit, :update]
  # before_filter :set_search

  def index
    @employees, @alphaParams = Employee.all.alpha_paginate(params[:letter], {enumerate: true, numbers: true, pagination_class: "pagination-centered"}){|employee| employee.first_name}
  end

  def show; end

  def new
    @employee = Employee.new
  end

  def create
    if params[:file]
      Employee.import(params[:file])
      redirect_to employees_path
    elsif params[:employee]
      if @employee = Employee.create(employee_params)
        render 'show'
      else
        render 'new'
      end
    end
  end

  def edit; end

  def update
    if @employee.update(employee_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    Employee.destroy(params[:id])
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:job_title, :pref_pronouns, :first_name, :last_name, :email, :twitter_handle, :linkedin, :github_username, :expertise_areas, :q)
    # SHOULD USE when passing a hash to any of those methods, do this to prevent injection risks
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

end
