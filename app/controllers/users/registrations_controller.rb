class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
    
    @course = Course.new
    resource.courses << @course
  end
  
  def create
    super
    
    course = params.require(:course).permit(:skill, :location, :datetime, :certification_url)
    Rails.logger.info course.to_s
    @course = Course.create(course)
    @course.user_id = resource.id
    @course.save
    resource.save
  end
end
