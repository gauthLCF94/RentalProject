class AppartementController < ApplicationController
  skip_before_action :authenticate_user!, only: :index, :show

  def index
    @appartements = Appartement.all
    respond_to do |format|
      format.html
      format.xml { render xml: @appartements }
      format.json { render json: @appartements }
    end
  end

  def new # return HTML form for create
  end

  def create
    @appartement = Appartement.new(params[:name], params[:price], params[:description], params[:adress], params[:postcode], params[:city])
    @appartement.save
  end

  def show
    @appartement = Appartement.where(id: params[:id])
    respond_to do |format|
      format.html
      format.xml { render xml: @appartement }
      format.json { render json: @appartement }
    end
  end

  def edit # return HTML form for edit
  end

  def update
    @appartement = Appartement.find_by(id: params[:id])
    @appartement.name = params[:name]
    @appartement.price = params[:price]
    @appartement.description = params[:description]
    @appartement.adress = params[:adress]
    @appartement.postcode = params[:postcode]
    @appartement.city = params[:city]
    @appartement.save
  end

  def destroy
    @appartement = Appartement.find_by(params[:id])
    @appartement.destroy
  end
end
