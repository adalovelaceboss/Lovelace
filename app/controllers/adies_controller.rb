class AdiesController < ApplicationController
  before_action :require_authentication!
  before_action :find_adie, only: [:show, :edit]

  def index
    @adies = Adie.all
  end

  def show; end

  def new
    @adie = Adie.new
  end

  def create
    # upload

    @adie = Adie.new(first_name: params[:adie][:first_name],
    last_name: params[:adie][:last_name],
    cohort: params[:adie][:cohort],
    email: params[:adie][:email],
    pref_pronouns: params[:adie][:pref_pronouns],
    twitter_handle: params[:adie][:twitter_handle],
    linkedin: params[:adie][:linkedin],
    github_username: params[:adie][:github_username],
    internship_company: params[:adie][:internship_company],
    current_company: params[:adie][:current_company])
    @adie.save

    redirect_to adies_path
  end

  def edit
  end

  def update
    # if @adie.update(adie_params)
    #   redirect_to request.referrer
    # else
    #   render :edit
    # end

    @adie = Adie.update(first_name: params[:adie][:first_name],
    last_name: params[:adie][:last_name],
    cohort: params[:adie][:cohort],
    email: params[:adie][:email],
    pref_pronouns: params[:adie][:pref_pronouns],
    twitter_handle: params[:adie][:twitter_handle],
    linkedin: params[:adie][:linkedin],
    github_username: params[:adie][:github_username],
    internship_company: params[:adie][:internship_company],
    current_company: params[:adie][:current_company])

    redirect_to adies_path # temporary fix
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
    # this is for update/create/new, SHOULD USE when passing a hash to any of those methods, do this to prevent injection risks
  end

  def find_adie
    @adie = Adie.find(params[:id])
    # if !@adie || !@user.tasks.include?(@mytask)
    #   flash[:notice] = "Sorry, that is not one of your tasks."
    #   redirect_to root_path
    # end
  end


end
