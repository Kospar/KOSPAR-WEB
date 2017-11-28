class OpensrcsController < ApplicationController
  before_filter :custom_method, :only => [:new, :create,:edit,:update ,:destroy]
  before_filter :custom_method_2, :only => [:comment_destroy, :comment_edit]
  def index
    @srcs = Opensrc.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def new
  end

  def create
    @src = Opensrc.new
    @src.title = params[:title]
    @src.content = params[:content]
    @src.github = params[:github]
    @src.user_id = params[:user_id]
    @src.save
    
    redirect_to '/Opensrcs'
  end
  
  def show
    @src = Opensrc.find(params[:src_id])
    @comments = OpenComment.where(:opensrc_id => params[:src_id])
  end
  
  def edit
    @src = Opensrc.find(params[:src_id])
  end
  
  def destroy
    @src = Opensrc.find(params[:src_id])
    @src.destroy
    
    redirect_to '/Opensrcs'
  end
  
  def update
    @src = Opensrc.find(params[:src_id])
    @src.title = params[:title]
    @src.content = params[:content]
    @src.user_id = params[:user_id]
    @src.github = params[:github]
    @src.save
    
    redirect_to '/Opensrcs/show/'+params[:src_id]
  end
  
  def search_result 
    @result = Opensrc.all
    
    @method = params[:method]
    @search_keyword = params[:search_keyword]
    
    if @search_keyword == ""
      @result_1 = @result
    else
      if @method == "title"
        @result_1 = @result.where("title LIKE ?", "%#{@search_keyword}%")
      elsif @method == "title+content"
        @result_1 = @result.where("title LIKE :search OR content LIKE :search", search:"%#{@search_keyword}%")
      else
      end
    end
    @srcs = @result_1.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end
  
  def comment_create
    @comment = OpenComment.new
    @comment.opensrc_id = params[:src_id]
    @comment.content = params[:content]
    @comment.user_id = params[:user_id]
    @comment.save
    
    redirect_to "/Opensrcs/show/"+params[:src_id]
  end
  
  def comment_destroy
    @comment = OpenComment.find(params[:comment_id])
    @comment.destroy
    
    redirect_to "/Opensrcs/show/"+params[:src_id]
  end
  def comment_edit
    @comment = OpenComment.find(params[:comment_id])
    @comment.opensrc_id = params[:src_id]
    @comment.content = params[:content]
    @comment.user_id = params[:user_id]
    @comment.save
    
    redirect_to "/Opensrcs/show/"+params[:src_id]
  end
  def custom_method
    authenticate_user!
  
    if current_user.admin
       return
    else
       redirect_to(root_url , alert: "관리자만 작성/수정 할 수 있습니다.")
    end
  end
  def custom_method_2
    authenticate_user!
     @comment = OpenComment.find(params[:comment_id])
    if current_user.id == @comment.user_id
       return
    else
       redirect_to(root_url , alert: "본인만 수정/삭제 할 수 있습니다.")
    end
  end
end
