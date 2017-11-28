class Trend < ActiveRecord::Base
  belongs_to :user
  serialize :files, JSON
  mount_uploaders :files, TrendUploader
end
