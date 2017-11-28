class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location
  
  def admin_login
    if request.fullpath =~ /\/admin/
      redirect_to '/admin'
    end
  end
  
  def store_location
    # store last url as long as it isn't a /users path
    unless request.fullpath =~ (/\/users/) || request.fullpath =~ (/\/admin/)
        session[:previous_url] = request.fullpath
    end
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
        admin_root_path
    else
        session[:previous_url] || root_path
    end
  end
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) <<
                                        [:name, 
                                        :nickname, 
                                        :company_name,
                                        :company_private,
                                        :company_address,
                                        :company_address_post_num,
                                        :company_address_details,
                                        :company_address_extra_info,
                                        :company_tel_num_1,
                                        :company_tel_num_2,
                                        :company_tel_num_3
                                        ]
    devise_parameter_sanitizer.for(:account_update) <<
                                        [:name, 
                                        :nickname, 
                                        :company_name,
                                        :company_private,
                                        :company_address,
                                        :company_address_post_num,
                                        :company_address_details,
                                        :company_address_extra_info,
                                        :company_tel_num_1,
                                        :company_tel_num_2,
                                        :company_tel_num_3
                                        ]
  end
end
