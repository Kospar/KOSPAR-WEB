class AboutUsController < ApplicationController
  before_filter :custom_method, :only => [:new, :edit, :create,:update ,:destroy]
  def index
    @about = About.last
  end
  def new
  end
  def create
    @about = About.new
    @about.user_id = params[:user_id]
    @about.content = params[:content]
    @about.save
    
    redirect_to '/About_us'
  end
  def edit
    @about = About.last
  end
  def update
    @about = About.last
    @about.user_id = params[:user_id]
    @about.content = params[:content]
    @about.save
    
    redirect_to '/About_us'
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
