class QnasController < ApplicationController
  before_filter :custom_method, :only => [:reply, :reply_create, :reply_destroy, :reply_update, :reply_edit]
  before_filter :custom_method_2, :only => [:update, :destroy, :edit]
  def index
    @qnas = Qna.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def new
  end
  
  def create
    @qna = Qna.new
    @qna.title = params[:title]
    @qna.category = params[:category]
    @qna.content = params[:content]
    @qna.image = params[:image]
    @qna.user_id = params[:user_id]
    @qna.answer = false
    @qna.save
    
    redirect_to '/Q&A'
  end
  
  def show
    @qna = Qna.find(params[:qna_id])
  end
  
  def destroy
    @qna = Qna.find(params[:qna_id])
    @qna.destroy
    
    redirect_to "/Q&A"
  end
  
  def edit
    @qna = Qna.find(params[:qna_id])
  end
  def update
    @qna = Qna.find(params[:qna_id])
    @qna.title = params[:title]
    @qna.category = params[:category]
    @qna.content = params[:content]
    if params[:image] != nil
      @qna.image = params[:image]
    end
    @qna.user_id = params[:user_id]
    @qna.save
    
    redirect_to '/Q&A/show/'+params[:qna_id]
  end
  
  def reply
    @qna = Qna.find(params[:qna_id])
  end
  def reply_create
    @qna = Qna.find(params[:qna_id])
    @reply = Reply.new
    @qna.reply_id = @reply.id
    @qna.answer = true
    @reply.user_id = params[:user_id]
    @reply.title = params[:title]
    @reply.content = params[:content]
    @reply.image = params[:image]
    @reply.qna_id = params[:qna_id]
    
    @reply.save
    @qna.save
    redirect_to '/Q&A/show/'+params[:qna_id]
  end
  
  def reply_edit
    @qna = Qna.find(params[:qna_id])
    @reply = Reply.find(params[:reply_id])
  end
  
  def reply_update
    @qna = Qna.find(params[:qna_id])
    @reply = Reply.find(params[:reply_id])
    @qna.reply_id = @reply.id
    if params[:image] != nil
      @reply.image = params[:image]
    end
    @reply.title = params[:title]
    @reply.content = params[:content]
    @reply.qna_id = params[:qna_id]
    @reply.save
    @qna.save
    
    redirect_to '/Q&A/show/'+params[:qna_id]

  end
  
  def reply_destroy
    @qna = Qna.find(params[:qna_id])
    @reply = Reply.find(params[:reply_id])
    @qna.reply = nil
    @qna.answer = false
    @reply.destroy
    @qna.save

    redirect_to '/Q&A/show/'+params[:qna_id]
  end
  def search_result
    @result_0 = Qna.all
    
    @category = params[:category]
    @method = params[:method]
    @answer = params[:answer]
    @search_keyword = params[:search_keyword]
    
    if @category == "all"
      @result_1 = @result_0
    else
      @result_1 = @result_0.where(:category => @category)
    end

    if @answer == "all"
      @result_2 = @result_1
    elsif @answer == "no_answer"
      @result_2 = @result_1.where(:answer => false)
    else 
      @result_2 = @result_1.where(:answer => true)
    end
    
    if @search_keyword == ""
      @result_3 = @result_2
    else
      if @method == "title"
        @result_3 = @result_2.where("title LIKE ?", "%#{@search_keyword}%")
      elsif @method == "title+content"
        @result_3 = @result_2.where("title LIKE :search OR content LIKE :search", search:"%#{@search_keyword}%")
      else
        @writer = User.where("nickname LIKE ?", "%#{@search_keyword}%")
        @result_3 = @result_2.where(:user_id => @writer.ids )
      end
    end
    @qnas = @result_3.paginate(:page => params[:page], :per_page => 10).order('id DESC')
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
  def custom_method_2
    authenticate_user!
     @qna = Qna.find(params[:qna_id])
    if current_user == @qna.user
       return
    else
       redirect_to(root_url , alert: "작성자만 수정/삭제 할 수 있습니다.")
    end
  end
end
