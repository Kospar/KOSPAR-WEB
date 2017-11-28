class MainController < ApplicationController
  def index
    @trends = Trend.all.reverse
    @this_month = Date.today.strftime('%Y-%m')
    @this_month_notices = Notice.where("startDate like :search OR endDate like :search", search:"%#{@this_month}%").order("endDate DESC")
    @docs = DesignDocument.all.reverse
    @srcs = Opensrc.all.reverse
    @forums = ForumPost.all.reverse
    @boards = ForumBoard.all
  end
end
