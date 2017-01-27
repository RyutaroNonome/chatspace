class MessagesController < ApplicationController
  # before_action :authenticate_user!, only: [:index, :create]
  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
    @groups = current_user.groups
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html do
          redirect_to group_messages_path(params[:group_id]),
                      notice: '(((((((((((っ･ω･)っ メッセージを送信しました！'
        end
        format.json
      end
    else
      flash.now[:alert] = "メッセージが空だぞい_(┐「ε:)_"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.includes(:users).find(params[:group_id])
  end
end