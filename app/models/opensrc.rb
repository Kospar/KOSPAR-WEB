class Opensrc < ActiveRecord::Base
  belongs_to :user
  has_many :open_comments
end
