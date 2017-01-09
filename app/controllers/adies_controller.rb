class AdiesController < ApplicationController
  before_action :require_authentication!
  before_action :find_adie, only: [:show, :edit, :update]

  def index
    @adies = Adie.all
  end

  def show; end

  def new
    @adie = Adie.new
  end

  def create
    # upload

    if @adie = Adie.create(adie_params)
      render 'show'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @adie.update(adie_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def upload
    # @imported = Adie.import(params[:file])
    # @imported.save
    #
    # redirect_to adies_path
  end

  def destroy
    Adie.destroy(params[:id])

    redirect_to adies_path
  end

private

  def adie_params
    params.require(:adie).permit(:first_name, :last_name, :cohort, :email, :pref_pronouns, :twitter_handle, :linkedin, :github_username, :internship_company, :current_company)
    # SHOULD USE when passing a hash to any of those methods, do this to prevent injection risks
  end

  def find_adie
    @adie = Adie.find(params[:id])
    # if !@adie || !@user.tasks.include?(@mytask)
    #   flash[:notice] = "Sorry, that is not one of your tasks."
    #   redirect_to root_path
    # end
  end

end
