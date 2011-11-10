class UserController < ApplicationController
  def view
    user = User.find_by_student_id(params[:id]) rescue nil
    if user.nil?
      if student_img_checker(params[:id])
        user = User.create :student_id => params[:id]
      else
        redirect_to :file => "404.html", :status => :not_found
        return
      end
    end
    @student = user.student_id
    @total_streams = user.stream_votes.count
    @total_likes = 0;
    user.stream_votes.each do |vote|
      @total_likes = @total_likes + vote.like if vote.like
    end
  end

end
