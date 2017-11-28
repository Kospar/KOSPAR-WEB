class ForumsController < ApplicationController
  before_filter :custom_method_1, :only => [:edit,:update,:destroy]
  before_filter :custom_method_2, :only => [:comment_destroy, :comment_edit]
  def index
    @boards = ForumBoard.all
  end
  def new
    @boards = ForumBoard.all
    if params[:board_id] != nil || params[:board_id] != ""
      @board_id = params[:board_id].to_i
    end
  end
  def create
    @board =  ForumBoard.find(params[:forum_board_id])
    @post = @board.forum_posts.new
    @post.title = params[:title]
    @post.content = params[:content]
    if params[:files] != nil
      @post.files = params[:files]
    end
    @post.user_id = params[:user_id]
    @post.save
    
    redirect_to '/forums'
  end
  def edit
    @boards = ForumBoard.all
    @board =  ForumBoard.find(params[:board_id])
    @post = @board.forum_posts.find(params[:post_id])
  end
  
  def update
    if params[:board_id] == params[:prev_board_id]
      @board =  ForumBoard.find(params[:board_id])
      @post = @board.forum_posts.find(params[:post_id])
      if params[:delete_file_index] != ""
        if params[:delete_file_index].length > 1
          @tmp_count = 0
          @delete_file_index = params[:delete_file_index].split(",").sort!
          if @delete_file_index.length == @post.files.length
            @post.remove_files!
            @post.save
            if params[:files] != nil
              @post.files = params[:files]
            end
          else
            @remain_files = @post.files
            @delete_file_index.each do |d|
              @remain_files.delete_at(d.to_i-@tmp_count)
              @remain_files.try(:remove!)
              @tmp_count += 1
            end
            @post.files = @remain_files
            @post.save
            if params[:files] != nil
              @remain_files = @post.files
              @remain_files += params[:files]
              @post.files = @remain_files
            end
          end
        else
          @delete_file_index = params[:delete_file_index]
          if @delete_file_index.length == @post.files.length
            @post.remove_files!
            @post.save
            if params[:files] != nil
              @post.files = params[:files]
            end
          else
              @remain_files = @post.files
              @remain_files.delete_at(@delete_file_index.to_i)
              @remain_files.try(:remove!)
              @post.files = @remain_files
            @post.save
            if params[:files] != nil
              @remain_files = @post.files
              @remain_files += params[:files]
              @post.files = @remain_files
            end
          end
        end
      else
        if params[:files] != nil
          if @post.files != nil
            @remain_files = @post.files
            @remain_files += params[:files]
            @post.files = @remain_files
          else
            @post.files = params[:files]
          end
        end
      end
      @post.title = params[:title]
      @post.content = params[:content]
      @post.user_id = params[:user_id]
      @post.save
    else
      @board =  ForumBoard.find(params[:prev_board_id])
      @post = @board.forum_posts.find(params[:post_id])
      if params[:delete_file_index] != ""
        if params[:delete_file_index].length > 1
          @tmp_count = 0
          @delete_file_index = params[:delete_file_index].split(",").sort!
          if @delete_file_index.length == @post.files.length
            @post.remove_files!
            @post.save
            if params[:files] != nil
              @post.files = params[:files]
            end
          else
            @remain_files = @post.files
            @delete_file_index.each do |d|
              @remain_files.delete_at(d.to_i-@tmp_count)
              @remain_files.try(:remove!)
              @tmp_count += 1
            end
            @post.files = @remain_files
            @post.save
            if params[:files] != nil
              @remain_files = @post.files
              @remain_files += params[:files]
              @post.files = @remain_files
            end
          end
        else
          @delete_file_index = params[:delete_file_index]
          if @delete_file_index.length == @post.files.length
            @post.remove_files!
            @post.save
            if params[:files] != nil
              @post.files = params[:files]
            end
          else
              @remain_files = @post.files
              @remain_files.delete_at(@delete_file_index.to_i)
              @remain_files.try(:remove!)
              @post.files = @remain_files
            @post.save
            if params[:files] != nil
              @remain_files = @post.files
              @remain_files += params[:files]
              @post.files = @remain_files
            end
          end
        end
      else
        if params[:files] != nil
          if @post.files != nil
            @remain_files = @post.files
            @remain_files += params[:files]
            @post.files = @remain_files
          else
            @post.files = params[:files]
          end
        end
      end
      @files_tmp_store = @post.files
      @board =  ForumBoard.find(params[:board_id])
      @post_new = @board.forum_posts.new
      @post_new.title = params[:title]
      @post_new.content = params[:content]
      @post_new.files = @files_tmp_store
      @post_new.user_id = params[:user_id]
      @post_new.save
      @post.destroy
      @post = @post_new
    end
    redirect_to '/forums/'+params[:board_id]+"/post/"+@post.id.to_s
  end
  
  def board_show
    @boards = ForumBoard.all
    @board =  ForumBoard.find(params[:board_id])
    @posts =  @board.forum_posts.paginate(:page => params[:page], :per_page => 20).order('id DESC')
  end
  
  def post_show
    @board =  ForumBoard.find(params[:board_id])
    @post = @board.forum_posts.find(params[:post_id])
    @comments = @post.forum_comments
  end
  
  def destroy
    @board =  ForumBoard.find(params[:board_id])
    @post = @board.forum_posts.find(params[:post_id])
    @post.destroy
    
    redirect_to '/forums'
  end
  def comment_create
    @board =  ForumBoard.find(params[:board_id])
    @post = @board.forum_posts.find(params[:post_id])
    @comment = @post.forum_comments.new
    @comment.content = params[:content]
    @comment.user_id = params[:user_id]
    @comment.save
    
    redirect_to '/forums/'+params[:board_id]+"/post/"+@post.id.to_s
  end
  
  def comment_edit
    @board =  ForumBoard.find(params[:board_id])
    @post = @board.forum_posts.find(params[:post_id])
    @comment = @post.forum_comments.find(params[:comment_id])
    @comment.content = params[:content]
    @comment.user_id = params[:user_id]
    @comment.save
    
    redirect_to '/forums/'+params[:board_id]+"/post/"+@post.id.to_s
  end
  
  def comment_destroy
    @board =  ForumBoard.find(params[:board_id])
    @post = @board.forum_posts.find(params[:post_id])
    @comment = @post.forum_comments.find(params[:comment_id])
    @comment.destroy
    
    redirect_to '/forums/'+params[:board_id]+"/post/"+@post.id.to_s
  end
  def custom_method_1
    authenticate_user!
     @board =  ForumBoard.find(params[:board_id])
     @post = @board.forum_posts.find(params[:post_id])
    if current_user.id == @post.user_id
       return
    else
       redirect_to(root_url , alert: "본인만 수정/삭제 할 수 있습니다.")
    end
  end
  def custom_method_2
    authenticate_user!
    @board =  ForumBoard.find(params[:board_id])
    @post = @board.forum_posts.find(params[:post_id])
    @comment = @post.forum_comments.find(params[:comment_id])
    if current_user.id == @comment.user_id
       return
    else
       redirect_to(root_url , alert: "본인만 수정/삭제 할 수 있습니다.")
    end
  end
end
