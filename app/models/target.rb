class Target < ActiveRecord::Base
  has_many :sessions, through: :session_targets
  has_many :session_targets, dependent: :destroy

  validates :global_id, presence: true, allow_blank: false
end
