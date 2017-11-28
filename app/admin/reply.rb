ActiveAdmin.register Reply do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 menu parent: 'QnA', label: '답변 관리' , priority: 2
 
 actions :index, :update, :edit, :destroy
  index do
    selectable_column
    actions
    Reply.column_names.each do |c|
      column c.to_sym
    end
  end
 permit_params do
    permitted  [:permitted, :id, :title, :content, :image, :user_id, :qna_id, :created_at, :updated_at]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
 end
 filter :created_at
end