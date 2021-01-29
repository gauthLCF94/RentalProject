class AppartementsController < ApplicationController
  before_action :set_appartement, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @appartements = policy_scope(Appartement)
    respond_to do |format|
      format.html
      format.xml { render xml: @appartements }
      format.json { render json: @appartements }
    end
  end

  def new
    @appartement = Appartement.new
    authorize @appartement
  end

  def create
    @appartement = Appartement.new(appartement_params)
    authorize @appartement
    @appartement.user_id = current_user.id
    if @appartement.save
      redirect_to appartement_path(@appartement)
    else
      render 'new'
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render xml: @appartements }
      format.json { render json: @appartements }
    end
  end

  def edit
  end

  def update
    @appartement.update(appartement_params)
    redirect_to appartement_path(@appartement)
  end

  def destroy
    @appartement = Appartement.find_by(params[:id])
    @appartement.destroy
  end

  private

  def set_appartement
    @appartement = Appartement.find(params[:id])
    authorize @appartement
  end

  def appartement_params
    params.require(:appartement).permit(:price, :description, :adress, :postcode, :city)
  end
end
