ActiveAdmin.register ForumBoard do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
 menu parent: 'KOSPAR Forums', label: '게시판 관리' , priority: 1
#
# or
#
 actions :index, :update, :edit, :destroy
  index do
    selectable_column
    actions
    ForumBoard.column_names.each do |c|
      column c.to_sym
    end
  end
 permit_params do
    permitted = [:permitted, :id, :subject, :user_id, :created_at, :updated_at]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
 end
 filter :created_at
end