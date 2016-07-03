class Api::V1::BugsController < Api::V1::ApiController
  def show
    @bug = current_app.bugs.find_by(number: params[:number])
    respond_with @bug
  end
  
  def create
    respond_with @bug = current_app.bugs.create(bug_params)
  end
  
  def count
    respond_with @app = current_app
  end
  
protected
  
  def bug_params
    params.fetch(:bug, {}).permit(:priority)
  end
end
