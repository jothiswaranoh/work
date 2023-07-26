class StudentsController < ApplicationController
    def test
      @student = Students.new1 # Create a new student
      @students = Students.all # View all students
    end
  
    def create
      @student = Student.new(student_params)
      if @student.save # Save the student
        redirect_to student_path(@student)
      else
        render :new # Render the 'new' template again in case of validation errors
      end
    end
  
    private
  
    def student_params
      params.require(:student).permit(:first_name, :last_name, :class, :email, :password)
    end
  end
  