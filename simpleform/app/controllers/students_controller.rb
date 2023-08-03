class StudentsController < ApplicationController
    def test
      @student = Student.new
    end
  
    def create
      @student = Student.new(student_params)
      if @student.save
        redirect_to student_path(@student)
      else
        render :new
      end
    end
  
    def index
      @students = Student.all
    end
  
    private
  
    def student_params
      params.require(:student).permit(:first_name, :last_name, :student_class, :email, :password)
    end
  end
  