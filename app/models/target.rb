class Target < ActiveRecord::Base
  has_many :sessions, through: :session_targets
  has_many :session_targets, dependent: :destroy

  validates :global_id, presence: true, allow_blank: false
  def query_path
    Settings.service.query_url + global_id
    "https://dream.misasa.okayama-u.ac.jp/?q=#{self.global_id}"
  end
end
