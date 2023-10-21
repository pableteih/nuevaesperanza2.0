class ApplicationController < ActionController::Base

    def authenticate_admin
        unless current_user && current_user.role == "admin"
          flash[:alert] = "Acceso no autorizado."
          redirect_to root_path
        end
      end
end
