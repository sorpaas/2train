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
          if request.skill.downcase.include? course.skill.downcase
            value = true
          end
        end
        value
      end
    end
  end
  
  def show
    @request = Request.find(params[:id])
  end
  
  def recomment
    @request = Request.find(params[:id])
    @user = current_user
    @message = params.require(:comment).permit(:message)[:message]
    
    @comment = Comment.create
    @comment.request_id = @request.id
    @comment.user_id = @user.id
    @comment.message = @message
    @comment.save
    
    redirect_to action: :show, id: params[:id]
  end
end
