class MessageController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @messages = policy_scope(Message)
    respond_to do |format|
      format.html
      format.xml { render xml: @messages }
      format.json { render json: @messages }
    end
  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.user_id = current_user.id
    @message.appartement_id = params[:id]
    if @message.save
      redirect to message_path(@message)
    else
      render 'new'
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render xml: @messages }
      format.json { render json: @messages }
    end
  end

  def edit
  end

  def update
    @message.update(message_params)
    redirect_to message_path(@message)
  end

  def destroy
    @message = Message.find_by(params[:id])
    @message.destroy
  end

  private

  def set_message
    @message = Message.find(params[:id])
    authorize @message
  end

  def message_params
    params.require(:message).permit(:contenu)
  end
end
