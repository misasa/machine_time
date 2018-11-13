class Session < ActiveRecord::Base
	include HasGlobalId
        has_many :targets, through: :session_targets
        has_many :session_targets, dependent: :destroy
        accepts_nested_attributes_for :session_targets, allow_destroy: true
	belongs_to :machine

#	before_save :generate_global_id, if: "global_id.blank?"
	before_save :generate_name, if: "name.blank?"

	acts_as_sequenced scope: :machine_id, column: :number
	validates :machine_id, presence: true, allow_nil: false 
	# def generate_global_id
	# 	time = Time.now
	# 	self.global_id =  time.strftime("%Y%m%d%H%M%S") + '-' + sprintf('%06d',time.usec)[-3..-1] + sprintf('%03d',rand(1000))
	# end

	def archiver_path
		return unless machine.archiver_url
		path = machine.archiver_url
		path += "?from=#{self.started_at}&to=#{self.stopped_at}&session_name=#{self.name}&session_gid=#{self.global_id}&session_id=#{self.id}"
	end

	def generate_name
		if machine.session_prefix
			name = "#{machine.session_prefix}#{number}"
		else
			name = "#{machine.name}-#{number}"
		end
		self.name = name
	end
        
        def to_label
          "#{self.global_id},#{self.name}"
        end
end
