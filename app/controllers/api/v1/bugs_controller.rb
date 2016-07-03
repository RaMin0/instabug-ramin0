class Api::V1::BugsController < Api::V1::ApiController
  def show
    respond_with @bug = current_app.bugs.find_by!(number: params[:number])
  end
  
  def create
    respond_with @bug = current_app.bugs.create(bug_params)
  end
  
  def count
    respond_with @app = current_app
  end
  
protected
  
  def bug_params
    params.fetch(:bug, {}).permit(:priority, state_attributes: [:device, :os, :memory, :storage])
  end
end
