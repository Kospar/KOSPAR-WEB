class DesignDocumentsController < ApplicationController
  before_filter :custom_method, :only => [:new, :create,:edit,:update ,:destroy]
  before_filter :custom_method_2, :only => [:comment_destroy, :comment_edit]
  def index
    @docs = DesignDocument.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def new
  end
  
  def create
    @doc = DesignDocument.new
    @doc.title = params[:title]
    @doc.content = params[:content]
    if params[:files] != nil
      @doc.files = params[:files]
    end
    @doc.user_id = params[:user_id]
    @doc.save
    
    redirect_to '/Design_documents'
  end
  def show
     @doc = DesignDocument.find(params[:doc_id])
     @comments = DocComment.where(:design_document_id => params[:doc_id])
  end

  def edit
    @doc = DesignDocument.find(params[:doc_id])
  end
  
  def update
    @doc = DesignDocument.find(params[:doc_id])
    if params[:delete_file_index] != ""
      if params[:delete_file_index].length > 1
        @tmp_count = 0
        @delete_file_index = params[:delete_file_index].split(",").sort!
        if @delete_file_index.length == @doc.files.length
          @doc.remove_files!
          @doc.save
          if params[:files] != nil
            @doc.files = params[:files]
          end
        else
          @remain_files = @doc.files
          @delete_file_index.each do |d|
            @remain_files.delete_at(d.to_i-@tmp_count)
            @remain_files.try(:remove!)
            @tmp_count += 1
          end
          @doc.files = @remain_files
          @doc.save
          if params[:files] != nil
            @remain_files = @doc.files
            @remain_files += params[:files]
            @doc.files = @remain_files
          end
        end
      else
        @delete_file_index = params[:delete_file_index]
        if @delete_file_index.length == @doc.files.length
          @doc.remove_files!
          @doc.save
          if params[:files] != nil
            @doc.files = params[:files]
          end
        else
            @remain_files = @doc.files
            @remain_files.delete_at(@delete_file_index.to_i)
            @remain_files.try(:remove!)
            @doc.files = @remain_files
          @doc.save
          if params[:files] != nil
            @remain_files = @doc.files
            @remain_files += params[:files]
            @doc.files = @remain_files
          end
        end
      end
    else
      if params[:files] != nil
        if @doc.files != nil
          @remain_files = @doc.files
          @remain_files += params[:files]
          @doc.files = @remain_files
        else
          @doc.files = params[:files]
        end
      end
    end
    @doc.title = params[:title]
    @doc.content = params[:content]
    @doc.user_id = params[:user_id]
    @doc.save
    
    redirect_to '/Design_documents/show/'+params[:doc_id]
  end
  
  def destroy
    @doc = DesignDocument.find(params[:doc_id])
    @doc.destroy
    
    redirect_to '/Design_documents'
  end

  def search_result 
    @result = DesignDocument.all
    
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
    @docs = @result_1.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end
  
  def comment_create
    @comment = DocComment.new
    @comment.design_document_id = params[:doc_id]
    @comment.content = params[:content]
    @comment.user_id = params[:user_id]
    @comment.save
    
    redirect_to "/Design_documents/show/"+params[:doc_id]
  end
  
  def comment_destroy
    @comment = DocComment.find(params[:comment_id])
    @comment.destroy
    
    redirect_to "/Design_documents/show/"+params[:doc_id]
  end
  def comment_edit
    @comment = DocComment.find(params[:comment_id])
    @comment.design_document_id = params[:doc_id]
    @comment.content = params[:content]
    @comment.user_id = params[:user_id]
    @comment.save
    
    redirect_to "/Design_documents/show/"+params[:doc_id]
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
     @comment = DocComment.find(params[:comment_id])
    if current_user.id == @comment.user_id
       return
    else
       redirect_to(root_url , alert: "본인만 수정/삭제 할 수 있습니다.")
    end
  end
end
