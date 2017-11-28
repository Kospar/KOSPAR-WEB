class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :qna
  mount_uploader :image, ReplyUploader
end
