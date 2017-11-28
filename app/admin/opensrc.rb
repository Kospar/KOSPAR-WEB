ActiveAdmin.register Opensrc do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 menu parent: 'Open Sources', label: '게시글 관리' , priority: 1
 actions :index, :update, :edit, :destroy
  index do
    selectable_column
    actions
    Opensrc.column_names.each do |c|
      column c.to_sym
    end
  end
 permit_params do
    permitted = [:permitted, :title, :content, :github]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
 end
 filter :created_at
end