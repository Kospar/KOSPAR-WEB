class TrendsController < ApplicationController
  before_filter :custom_method, :only => [:new, :edit, :create,:update ,:destroy]
  def latest
    @trends = Trend.paginate(:page => params[:page], :per_page => 5).order('id DESC')
  end
  def new
  end
  def create
    @trend = Trend.new
    @trend.title = params[:title]
    @trend.category = params[:category]
    @trend.content = params[:content]
    if params[:files] != nil
      @trend.files = params[:files]
    end
    @trend.user_id = params[:user_id]
    @trend.save
    
    redirect_to '/trends/latest'

  end
  def show
    @trend = Trend.find(params[:trend_id])
  end
  
  def edit
    @trend = Trend.find(params[:trend_id])
  end
  
  def update
    @trend = Trend.find(params[:trend_id])
    if params[:delete_file_index] != ""
      if params[:delete_file_index].length > 1
        @tmp_count = 0
        @delete_file_index = params[:delete_file_index].split(",").sort!
        if @delete_file_index.length == @trend.files.length
          @trend.remove_files!
          @trend.save
          if params[:files] != nil
            @trend.files = params[:files]
          end
        else
          @remain_files = @trend.files
          @delete_file_index.each do |d|
            @remain_files.delete_at(d.to_i-@tmp_count)
            @remain_files.try(:remove!)
            @tmp_count += 1
          end
          @trend.files = @remain_files
          @trend.save
          if params[:files] != nil
            @remain_files = @trend.files
            @remain_files += params[:files]
            @trend.files = @remain_files
          end
        end
      else
        @delete_file_index = params[:delete_file_index]
        if @delete_file_index.length == @trend.files.length
          @trend.remove_files!
          @trend.save
          if params[:files] != nil
            @trend.files = params[:files]
          end
        else
            @remain_files = @trend.files
            @remain_files.delete_at(@delete_file_index.to_i)
            @remain_files.try(:remove!)
            @trend.files = @remain_files
          @trend.save
          if params[:files] != nil
            @remain_files = @trend.files
            @remain_files += params[:files]
            @trend.files = @remain_files
          end
        end
      end
    else
      if params[:files] != nil
        if @trend.files != nil
          @remain_files = @trend.files
          @remain_files += params[:files]
          @trend.files = @remain_files
        else
          @trend.files = params[:files]
        end
      end
    end
    @trend.title = params[:title]
    @trend.category = params[:category]
    @trend.content = params[:content]
    @trend.user_id = params[:user_id]
    @trend.save
    
    redirect_to '/trends/latest/'+params[:trend_id]
  end
  
  def destroy
    @trend = Trend.find(params[:trend_id])
    @trend.destroy
    
    redirect_to '/trends/latest'
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
