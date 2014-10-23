require 'rails_helper'

RSpec.describe Session, :type => :model do
  describe ".generate_global_id" do
    subject { obj.global_id }
    let(:obj){FactoryGirl.build(:session,global_id: global_id, machine_id: machine_id)}
    before {
    	machine
    	obj.save 
    }
    context "global_id is nil" do
      let(:global_id){nil}
      let(:machine_id){ machine.id }
	  let(:machine){ FactoryGirl.create(:machine, name: "SIMS5f")}    

      it{expect(subject).to be_present}
    end
    context "global_id is not nil" do
      let(:global_id){"aaa"}

      let(:machine_id){ machine.id }
      let(:machine){ FactoryGirl.create(:machine, name: "SIMS5f")}    

      it{expect(subject).to eq global_id}
    end
  end

  describe ".generate_name" do
  	let(:machine){ FactoryGirl.create(:machine, name: "USSA-5000", session_prefix: "5k")}
  	let(:obj){ FactoryGirl.build(:session, machine_id:machine.id)}
  	before do
  		obj.name = nil
  		machine
  		obj.save
  	end
  	it { expect(obj.name).to include(machine.session_prefix) }
  end


  describe ".sequence_id" do
  	let(:machine){ FactoryGirl.create(:machine)}
  	before {
  		machine
  		FactoryGirl.create(:session, machine_id: machine.id, number:100)
  		5.times do
  			FactoryGirl.create(:session, machine_id: machine.id )
  		end
  		FactoryGirl.create(:session, machine_id: machine.id, number:1000)
  		5.times do
  			FactoryGirl.create(:session, machine_id: machine.id )
  		end

  	}

  	it { expect(nil).to be_nil }
  end
end
