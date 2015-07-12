class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]

  def index
    # Messageを全て取得する。
    @messages = Message.all
    @message = Message.new
  end

  ## ここから追記
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path , notice: 'メッセージを保存しました'
  end

  def edit
  end
  
  def set_message
    @message = Message.find(params[:id])
  end

  def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
    #params.require(@message).permit(:name, :body)
    #@message = Message.find(params[:id])
  end
  ## ここまで
end

