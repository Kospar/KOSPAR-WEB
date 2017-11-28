class MypageController < ApplicationController
  def index
    @doc_comments = DocComment.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @open_comments = OpenComment.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @qnas = Qna.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @forums = ForumPost.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @forum_comments = ForumComment.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end
end
