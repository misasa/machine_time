class Machine < ActiveRecord::Base
	validates :name, presence:true
	state_machine :initial => :stopped do
		state :stopped
		state :running

		event :start do
			transition [:stopped] => :running
		end

		event :stop do
			transition [:running] => :stopped
		end

	end
end
