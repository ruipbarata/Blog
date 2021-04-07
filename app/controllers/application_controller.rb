class ApplicationController < ActionController::Base

  before_action :set_application_presenter
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def set_application_presenter
      @application_presenter = ApplicationPresenter.new
    end

    def after_sign_in_path_for(_resource)
      users_root_path_url
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end

end
