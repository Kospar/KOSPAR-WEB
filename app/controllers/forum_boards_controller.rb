class ForumBoardsController < ApplicationController
  before_filter :custom_method, :only => [:index, :create,:update ,:destroy]
  def index
    @forums = ForumBoard.all
  end

  def create
    @forum = ForumBoard.new
    @forum.subject = params[:subject]
    @forum.save
    
    redirect_to '/forum_boards'
  end
  
  def update
    @forum = ForumBoard.find(params[:forum_id])
    @forum.subject = params[:subject]
    @forum.save
    
    redirect_to '/forum_boards'
  end
  
  def destroy
    @forum = ForumBoard.find(params[:forum_id])
    @forum.destroy
    
    redirect_to '/forum_boards'
  end
  def custom_method
    authenticate_user!
  
    if current_user.admin
       return
    else
       redirect_to(root_url , alert: "관리자만 작성/수정 할 수 있습니다.")
    end
  end
end
