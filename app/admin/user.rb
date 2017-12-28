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
    permitted = [:permitted, :id, :email, :name, :nickname, :admin, :company_name, :company_private, :company_address, :company_address_details, :company_address_extra_info, :company_address_post_num, :company_tel_num_1, :company_tel_num_2, :company_tel_num_3, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :created_at, :updated_at]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
 end 
 filter :created_at
end
