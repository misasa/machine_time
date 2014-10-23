class Session < ActiveRecord::Base
	belongs_to :machine

	before_save :generate_global_id, if: "global_id.blank?"
	before_save :generate_name, if: "name.blank?"

	acts_as_sequenced scope: :machine_id, column: :number
	validates :machine_id, presence: true, allow_nil: false 

	def generate_global_id
		time = Time.now
		self.global_id =  time.strftime("%Y%m%d%H%M%S") + '-' + sprintf('%06d',time.usec)[-3..-1] + sprintf('%03d',rand(1000))
	end

	def generate_name
		if machine.session_prefix
			name = "#{machine.session_prefix}#{number}"
		else
			name = "#{machine.name}-#{number}"
		end
		self.name = name
	end


end
