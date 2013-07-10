class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def tags
    respond_to do |format|
      format.json { render json: Tag.all }
    end
  end
end
