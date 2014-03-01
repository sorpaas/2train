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
    if user_signed_in?
      @requests = @requests.select do |request|
        value = false
        current_user.courses.each do |course|
          if request.skill.include? course.skill
            value = true
          end
        end
        value
      end
    end
  end
end
