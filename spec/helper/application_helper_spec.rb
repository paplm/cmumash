# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'application_helper'

describe ApplicationHelper do
  before(:each) do
    @application_helper = ApplicationHelper.new
  end

  it "should check img for student" do
    @application_helper.student_img_checker(502115032).should be_true
  end
end

