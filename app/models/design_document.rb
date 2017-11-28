class DesignDocument < ActiveRecord::Base
  belongs_to :user
  has_many :doc_comments
  serialize :files, JSON
  mount_uploaders :files, DesignDocumentUploader
end
