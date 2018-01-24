class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @taskline = current_user.tasklines.build  # form_for 用
      @tasklines = current_user.tasklines.order('created_at DESC').page(params[:page])
    end
  end
end
