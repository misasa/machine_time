class SessionTarget < ActiveRecord::Base
  belongs_to :session
  belongs_to :target
end
