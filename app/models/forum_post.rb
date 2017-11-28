class ForumPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum_board
  has_many :forum_comments
  serialize :files, JSON
  mount_uploaders :files, ForumUploader
end
