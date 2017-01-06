class AdiesController < ApplicationController
  before_action :require_authentication!

  def index
  end

  def show
    @adie = Adie.find(params[:id])
  end

  def new
    @adie = Adie.new
  end

  def create
    upload
    @Adies = Adie.last.first_name

    redirect_to adies_path
  end

  def edit
  end

  def update
  end

  def upload
    Adie.import(params[:file])
  end

  def destroy
  end
end
