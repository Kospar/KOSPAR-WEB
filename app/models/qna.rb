class Qna < ActiveRecord::Base
  belongs_to :user
  has_one :reply
  mount_uploader :image, QnaUploader
end
