class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update]

  def index
    @companies, @alphaParams = Company.all.alpha_paginate(params[:letter], {enumerate: true, numbers: true, pagination_class: "pagination-centered"}){|company| company.company_name}
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

def find_company
  @company = Company.find(params[:id])
  end
end
