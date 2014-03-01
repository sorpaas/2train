class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  
  def take
    course = Course.find(params[:id])
    if course
      course.number ||= 0
      course.number += 1
      course.save
    end
  end
end
