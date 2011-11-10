class ApplicationController < ActionController::Base
  require 'open-uri'
  protect_from_forgery

  def student_img_checker(student_id)
    begin
      open("http://mis.cmu.ac.th/cmumis/images/student/#{student_id}.jpg") if User.find_by_student_id(student_id).nil?
    rescue
      nil
    else
      true
    end
  end

  def random_img
    r = Random.new
    year = r.rand(49...55).to_s
    department = r.rand(1...21).to_s
    major = [10,12,15][r.rand(0...3)].to_s
    last = r.rand(0...9).to_s + r.rand(0...9).to_s + r.rand(0...9).to_s
    rand = year+department+major+last
    if student_img_checker rand.to_i
      puts "found id: #{rand.to_i}"
      return rand
    else
      puts "fail id: #{rand.to_i}"
      random_img
    end
  end


end
