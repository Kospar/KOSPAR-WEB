ActiveAdmin.register Notice do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 actions :index, :update, :edit, :destroy
  index do
    selectable_column
    actions
    Notice.column_names.each do |c|
      column c.to_sym
    end
  end
 menu priority: 6
 permit_params do
    permitted = [:permitted, :id, :title, :startDate, :endDate, :address, :y_location, :x_location, :content, :user_id, :created_at, :updated_at]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
 end
 filter :created_at
end