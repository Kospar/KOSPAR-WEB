class OpenComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :openscr
end
