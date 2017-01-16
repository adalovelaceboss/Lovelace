class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update]

  def index
    @companies, @alphaParams = Company.all.alpha_paginate(params[:letter], {enumerate: true, numbers: true, pagination_class: "pagination-centered"}){|company| company.company_name}
  end

  def show; end

  def new
    @company = Company.new
  end

  def create
    if params[:file]
      Company.import(params[:file])
      redirect_to companies_path
    elsif params[:adie]
      if @company = Company.create(company_params)
        render 'show'
      else
        render 'new'
      end
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    Company.destroy(params[:id])
    redirect_to companies_path
  end

private

def company_params
  params.require(:company).permit(:company_id, :company_name, :address, :city, :state, :zip_code, :business_field, :website, :logo, :query)
end

def find_company
  @company = Company.find(params[:id])
  end
end
