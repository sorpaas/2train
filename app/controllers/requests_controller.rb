class RequestsController < ApplicationController
  def new
    @request = Request.new
  end
  
  def create
    Request.create params.require(:request).permit(:email, :skill, :location)
    redirect_to url_for(controller: :courses, action: :index)
  end
  
  def index
    @requests = Request.all
  end
end
