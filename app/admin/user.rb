ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
 menu label: 'Users', priority: 0
#
# or
#
  actions :index, :update, :edit, :destroy
  index do
    selectable_column
    actions
    User.column_names.each do |c|
      column c.to_sym
    end
  end
 permit_params do
    permitted = [:permitted, :email, :name, :nickname, :admin, :company_name, :company_private, :company_address, :company_address_details, :company_address_extra_info, :company_address_post_num, :company_tel_num_1, :company_tel_num_2, :company_tel_num_3]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
 end
 filter :created_at
end