class AdminPageController < ApplicationController
  before_filter :custom_method, :only => [:index]
  def index
    @qnanoA = Qna.where(:answer => false).paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @doc_comments = DocComment.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @open_comments = OpenComment.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @qnas = Reply.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @forums = ForumPost.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @forum_comments = ForumComment.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end
  
  private
  def custom_method
    authenticate_user!
  
    if current_user.admin
       return
    else
       redirect_to(root_url , alert: "관리자만 작성/수정 할 수 있습니다.")
    end
  end
end
