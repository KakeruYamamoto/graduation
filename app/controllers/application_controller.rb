class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  # 例外処理 
  rescue_from CanCan::AccessDenied do |exception|
     redirect_to main_app.root_path, alert: exception.message
  end


  def after_sign_in_path_for(resource)
    events_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon])
  end

  def set_search
    if params[:q] != nil
      params[:q]['title_or_content_or_address_cont_any'] = params[:q]['title_or_content_or_address_cont_any'].split(/[\p{blank}\s]+/)
      @q = Event.ransack(params[:q])
      @events = @q.result.order(e_date_start: :desc).page(params[:page]).per(12)
    else
      @q = Event.ransack(params[:q])
      @events = @q.result(distinct: true).order(e_date_start: :desc).page(params[:page]).per(12)
    end
  end

end
