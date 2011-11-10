class StreamController < ApplicationController

  def vote
    @students = []
    @likes = []
    begin
      @stream = Stream.find(params[:id])
      @stream.stream_votes.each do |vote|
        @students << User.find(vote.user_id).student_id
        @likes << vote.like
      end
    rescue
      redirect_to(create_url)
    end
  end

  def create
    @stream = Stream.new
    unless (params[:usr1].nil?||params[:usr2].nil?)
      begin
        if(student_img_checker(params[:usr1]) && student_img_checker(params[:usr2]))
          user1 = User.find_all_by_student_id(params[:usr1]).empty? ? User.create(:student_id => params[:usr1]) : User.find_by_student_id(params[:usr1])
          user2 = User.find_all_by_student_id(params[:usr2]).empty? ? User.create(:student_id => params[:usr2]) : User.find_by_student_id(params[:usr2])
          unless user1 == user2
            all_streams = user1.stream_votes.collect { |v| v.stream_id  }
            all_streams.each {|stream|
              redirect_to(vote_url(:id=>stream)) if StreamVote.find(:first , :conditions => ("user_id != #{user1.id} and stream_id = #{stream}")).user_id == user2.id
              return
            }
            @stream.save
            StreamVote.create(:stream_id=>@stream.id,:user_id=>user1.id)
            StreamVote.create(:stream_id=>@stream.id,:user_id=>user2.id)
            redirect_to(vote_url(:id=>@stream.id))
            return
          else
            redirect_to(create_url)
            return
          end
        end
      rescue
        redirect_to(create_url)
        return
      end
    end
  end

  def hit_like
    begin
      usr = User.find_by_student_id(params[:user])
      vote = StreamVote.find(:first, :conditions => {:stream_id => params[:stream], :user_id => usr})
      vote.like = vote.like+1
      vote.save
      redirect_to user_path(:id => params[:user])
    rescue
      redirect_to :back
    end
  end

end
