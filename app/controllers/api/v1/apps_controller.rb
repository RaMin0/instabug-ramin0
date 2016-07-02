class Api::V1::AppsController < Api::V1::ApiController
  skip_before_action :authenticate_app_from_token!
  
  def create
    respond_with @app = App.create(app_params)
  end
  
protected
  
  def app_params
    params.fetch(:app, {}).slice(:name).permit!
  end
end
