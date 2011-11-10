class HomeController < ApplicationController
  def index
    @users = User.all.collect { |usr| usr.student_id  }
  end

  def img_check
    render :json => {:valid => student_img_checker(params[:id])}.to_json
  end


end
