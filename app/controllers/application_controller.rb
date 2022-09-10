class ApplicationController < ActionController::Base
    #Notice flash type
    add_flash_types :success, :warning, :info
    protect_from_forgery with: :exception
    before_action  :set_city,
                    :set_material,
                    :set_level,
                    :store_action
    

    #Keep clean Application conroller, moved on noncern
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    
    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
        root_path
    end

    def after_sign_in_path_for(resource)
        feed_path
    end

    #User Ombording
    def after_sign_up_path_for(resource)
        case current_user.user_role 
        when "Student"
            profil_path
        when "Teacher"
            profil_path
        when "Ambassadeur"
            dashboard_path
        when "Team"
            dashboard_path            
        else
            root_path
        end
    end
  
private

    def set_city
        @citytowns = Citytown.all
    end

    def set_material
        @materials = Material.all
    end

    def set_level
        @levels = Level.all
    end
    def store_action
        return unless request.get? 
        if (request.path != "/users/sign_in" &&
            request.path != "/users/sign_up" &&
            request.path != "/users/password/new" &&
            request.path != "/users/password/edit" &&
            request.path != "/users/confirmation" &&
            request.path != "/users/sign_out" &&
            !request.xhr?) # don't store ajax calls
        store_location_for(:user, request.fullpath)
        end
    end
protected
     #Configure permitted parameters
    def configure_permitted_parameters
        #Sign Up account params
        sign_up_params = [:email, :password, :first_name, :last_name, :full_name, :contact, :matricule,
            :user_role, :gender, :city_name, :level_name, :school_name, :media_name, :material_name, :doublant, :slug]
        #Update account params
        update_params = [:first_name, :last_name, :full_name, :contact, :matricule,
            :user_role, :gender, :city_name, :level_name, :material_name, :doublant, 
            :password, :password_confirmation, :current_password]

        devise_parameter_sanitizer.permit(:sign_in, keys: [:logged, :password])
        devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_params )
        devise_parameter_sanitizer.permit(:account_update, keys: sign_up_params)
    end
end
