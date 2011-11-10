class User < ActiveRecord::Base
  has_many :stream_votes

end
