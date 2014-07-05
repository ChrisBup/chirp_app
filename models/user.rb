class User < ActiveRecord::Base
  has_many :chirps
end
