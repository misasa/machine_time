module HasGlobalId
	extend ActiveSupport::Concern
  	included do
		before_save :generate_global_id, if: "global_id.blank?"
    end
    
	def generate_global_id
		time = Time.now
		self.global_id =  time.strftime("%Y%m%d%H%M%S") + '-' + sprintf('%06d',time.usec)[-3..-1] + sprintf('%03d',rand(1000))
	end
end
