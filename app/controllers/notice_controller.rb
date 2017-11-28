class NoticeController < ApplicationController
  before_filter :custom_method, :only => [:new, :edit, :create,:update ,:destroy]
  def index
    @this_month = Date.today.strftime('%Y-%m')
    @notices = Notice.all
    @this_month_notices = Notice.where("startDate like :search OR endDate like :search", search:"%#{@this_month}%").order("endDate DESC")
    @prev_month_notices = Notice.where("startDate not like :search AND endDate not like :search", search:"%#{@this_month}%").order("endDate DESC")
  end
  
  def new
  end
  
  def create
    @notice = Notice.new
    @notice.title = params[:title]
    @notice.user_id = params[:user_id]
    @notice.content = params[:content]
    @notice.startDate = params[:startDate]
    @notice.endDate = params[:endDate]
    @notice.address = params[:address]
    @notice.x_location = params[:x_location]
    @notice.y_location = params[:y_location]
    @notice.save
    
    redirect_to '/Notice'
  end
  
  def show
    @notice = Notice.find(params[:notice_id])
  end
  
  def edit
    @notice = Notice.find(params[:notice_id])
  end
  
  def update
    @notice = Notice.find(params[:notice_id])
    @notice.title = params[:title]
    @notice.user_id = params[:user_id]
    @notice.content = params[:content]
    if params[:startDate] != ""
      @notice.startDate = params[:startDate]
    end
    if params[:endDate] != ""
      @notice.endDate = params[:endDate]
    end
    @notice.address = params[:address]
    if params[:x_location] != "" and params[:y_location] !=""
      @notice.x_location = params[:x_location]
      @notice.y_location = params[:y_location]
    end
    @notice.save
    
    redirect_to '/Notice/'+params[:notice_id]
    
  end
  
  def destroy
    @notice = Notice.find(params[:notice_id])
    @notice.destroy
    
    redirect_to '/Notice'
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
