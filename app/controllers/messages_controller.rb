class MessagesController < ApplicationController
  before_action :set_group
  
  def index
    # 新しいメッセージを入力する為の箱
    @message = Message.new
    # 元々あるメッセージ。includesはN+1問題を解決してる
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
    respond_to do |format|
      format.html{ redirect_to group_messages_path, notice: "メッセージを送信しました" }
      format.json
    end
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
