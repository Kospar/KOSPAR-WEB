class DocComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :design_document
end
