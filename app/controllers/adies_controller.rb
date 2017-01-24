class AdiesController < ApplicationController
  # before_action :require_authentication!
  before_action :find_adie, only: [:show, :edit, :update, :can_edit]
  before_filter :set_search

  def index
    if !params[:commit].nil? && params[:commit].downcase == "search"
      if !params[:q].blank?
        @results = Adie.search(params[:q])
      else
        @results = Adie.search({:id_eq => 0})
      end
        @adies = @results.result
        @adies, @alphaParams = @adies.alpha_paginate(params[:letter]){|adie| adie.first_name + adie.last_name}
    else
      @adies, @alphaParams = Adie.all.alpha_paginate(params[:letter], {enumerate: true, numbers: true, pagination_class: "pagination-centered"}){|adie| adie.first_name + adie.last_name}
    end
  end

  def show; end

  def new
    @adie = Adie.new
  end

  def create
    if params[:file]
      Adie.import(params[:file])
      redirect_to adies_path
    elsif params[:adie]
      if @adie = Adie.create(adie_params)
        render 'show'
      else
        render 'new'
      end
    end
  end

  def edit;
    if can_edit?
      render 'edit'
    else
      flash[:notice] = "You do not have access to edit this account."
      redirect_to adies_path
    end
  end

  def update
    if can_edit?
      if @adie.update(adie_params)
        render 'show'
      else
        render 'edit'
      end
    else
      flash[:notice] = "You do not have access to edit this account."
      redirect_to adies_path
    end
  end

  def destroy
    Adie.destroy(params[:id])
    redirect_to adies_path
  end

private

  def adie_params
    params.require(:adie).permit(:first_name, :last_name, :cohort, :email, :pref_pronouns, :twitter_handle, :linkedin, :github_username, :internship_company, :current_company, :q)
    # SHOULD USE when passing a hash to any of those methods, do this to prevent injection risks
  end

  def find_adie
    @adie = Adie.find(params[:id])
  end

  def can_edit?
    # find_adie
    current_account.username == @adie.github_username || current_account.username == "ellevargas"
  end

end
