module ApplicationHelper
  require 'open-uri'
  def student_img(student_id)
    "http://mis.cmu.ac.th/cmumis/images/student/#{student_id}.jpg"
  end

  def student_img_checker(student_id)
    begin
      open("http://mis.cmu.ac.th/cmumis/images/student/#{student_id}.jpg")
    rescue OpenURI::HTTPError
      nil
    else
      true
    end
  end
end
