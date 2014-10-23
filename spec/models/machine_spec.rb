require 'rails_helper'

RSpec.describe Machine, :type => :model do
  describe ".start" do
  	subject { obj.state }
    let(:obj){FactoryGirl.create(:machine)}
    before {
    	obj.start
    }
    context "state is stopped" do
      it{expect(subject).to be_eql("running")}
      it{expect(obj.can_start?).to be_falsey }
      it{expect(obj.can_stop?).to be_truthy }
      it{expect(obj.start).to be_falsey }
      it{expect{obj.start!}.to raise_error }
    end
  end

  describe ".stop" do
  	subject { obj.state }
    let(:obj){FactoryGirl.create(:machine, state: 'running')}
    before {
    	obj.stop
    }
    context "state is stopped" do
      it{expect(subject).to be_eql("stopped")}
      it{expect(obj.can_start?).to be_truthy }
      it{expect(obj.start).to be_truthy }
      it{expect{obj.start!}.not_to raise_error }
      it{expect(obj.can_stop?).to be_falsey }
      it{expect(obj.stop).to be_falsey}
	  it{expect{obj.stop!}.to raise_error}  
    end
  end

end
