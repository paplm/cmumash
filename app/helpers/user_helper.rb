module UserHelper
  def render_likes_result likes
    likes>0 ? "#{likes} likes" : ""
  end
  def render_streams_result streams
    streams>0 ? "#{streams} times on stream" : ""
  end
end
