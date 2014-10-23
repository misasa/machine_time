class Machine < ActiveRecord::Base
	has_many :sessions

	validates :name, presence:true
	state_machine :initial => :stopped do
		state :stopped
		state :running

		before_transition :on => :start, :do => :start_session
		before_transition :on => :stop, :do => :stop_session

		event :start do
			transition [:stopped] => :running
		end

		event :stop do
			transition [:running] => :stopped
		end

	end

	def start_session
		finish_session if current_session
		unless current_session
			time = Time.now		
			session = self.sessions.build(:started_at => Time.now)
			session.save
		end
	end

	def stop_session
		time = Time.now
		if session = current_session
			session.stopped_at = time
			session.save
		end
	end

	def current_session
		sessions_running.first unless sessions_running.empty?
	end

	def sessions_running
		sessions_started.where(stopped_at: nil)
	end

	def sessions_started
		sessions.where.not(started_at: nil)
	end

	def sessions_finished
		sessions.where.not(stopped_at: nil)
	end

	def last_session
		session = sessions_finished.order(started_at: :asc).last unless sessions_finished.empty?
	end

end
