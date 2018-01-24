class TasklinesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]


  def create
    @taskline = current_user.tasklines.build(taskline_params)
    if @taskline.save
      flash[:success] = 'タスクを投稿しました。'
      redirect_to root_url
    else
      @tasklines = current_user.tasklines.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'タスクの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @taskline.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def taskline_params
    params.require(:taskline).permit(:content)
  end

  def correct_user
    @taskline = current_user.tasklines.find_by(id: params[:id])
    unless @taskline
      redirect_to root_url
    end
  end
end
