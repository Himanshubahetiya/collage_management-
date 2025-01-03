class CoursesController < ApplicationController
  before_action :authenticate_user, only: [:assign]  
  
  def assign 
     
    @course = Course.find_by(course_name: params[:course_name])    

    if @course.present? 

      op = Course.where(account_id: @current_user.id)     


       top = op.where(course_name: params[:course_name])
      if @current_user && !top.present?
        course = Course.create(course_name: params[:course_name], account_id: @current_user&.id)
        render json: {message: course }, status: :ok
      else
        render json: { error: 'Course already assigned' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'you already have a 5 course ' }, status: :not_found
    end
  end

  private

 
  def authenticate_user

    token = request.headers['Authorization']&.split(' ')&.last

    if token.nil?
      render json: { error: 'Token is missing' }, status: :unauthorized
      return
    end

    begin      

      # Decode the token
      decoded = AuthenticateUser.decode(token)
      if decoded.present?
        @current_user = decoded # Set the current user from the decoded token
        @current_user = Account.find(decoded['user_id'])
      else
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
