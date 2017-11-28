ActiveAdmin.register Image do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 menu label:"에디터 첨부 이미지", priority:7
 actions :index, :update, :edit, :destroy
  index do
    selectable_column
    actions
    Image.column_names.each do |c|
      column c.to_sym
    end
  end
 permit_params do
    permitted = [:permitted, :alt, :hint, :file]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
 end
 filter :created_at
end