require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe SessionsController, :type => :controller do
  render_views
  # This should return the minimal set of attributes required to create a valid
  # Session. As you add validations to Session, be sure to
  # adjust the attributes here as well.
  let(:machine){ FactoryGirl.create(:machine)}
  let(:valid_attributes) {
    {machine_id: machine.id, name: 'test-123'}
#    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    {machine_id: nil}
#    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SessionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    before do
      @params = Hash.new
      @params[:machine_id] = machine.id
      @params[:q] = Hash.new
    end
    it "assings searched sessions as @sessions" do
      session = Session.create! valid_attributes
      session.started_at = Time.now
      sleep 5
      session.stopped_at = Time.now
      session.save
      @params[:q][:name_cont] = "test-123"
#      get :index, {:machine_id => machine.id}, valid_session
      get :index, @params, valid_session
      expect(assigns(:sessions)).to eq([session])
    end

    it "assings searched sessions with time as @sessions" do
      session = Session.create! valid_attributes
      session.started_at = Time.now
      sleep 2
      session_at = Time.now
      sleep 2
      session.stopped_at = Time.now
      session.save
      @params[:at] = session_at
#      @params[:q][:started_at_lteq] = session_at
#      @params[:q][:stopped_at_gteq] = session_at      
#      get :index, {:machine_id => machine.id}, valid_session
      get :index, @params, valid_session
      expect(assigns(:sessions)).to eq([session])
    end

    it "assigns all sessions as @sessions" do
      session = Session.create! valid_attributes
      @params[:q][:name_cont] = "hello"
      get :index, {:machine_id => machine.id}, valid_session
#      get :index, @params, valid_session
      expect(assigns(:sessions)).to eq([session])
    end

  end

  describe "GET show" do
    it "assigns the requested session as @session" do
      session = Session.create! valid_attributes
      get :show, {:machine_id => machine.id, :id => session.to_param}, valid_session
      expect(assigns(:session)).to eq(session)
    end
  end

  describe "GET new" do
    it "assigns a new session as @session" do
      machine = FactoryGirl.create(:machine)
      get :new, {:machine_id => machine.id}, valid_session
      expect(assigns(:session)).to be_a_new(Session)
    end
  end

  describe "GET edit" do
    it "assigns the requested session as @session" do
      session = Session.create! valid_attributes
      get :edit, {:machine_id => machine.id, :id => session.to_param}, valid_session
      expect(assigns(:session)).to eq(session)
    end
  end

  describe "POST create", :current => true do
    describe "with valid params" do
      it "creates a new Session" do
        expect {
          post :create, {:machine_id => machine.id, :session => valid_attributes}, valid_session
        }.to change(Session, :count).by(1)
      end

      it "assigns a newly created session as @session" do
        post :create, {:machine_id => machine.id, :session => valid_attributes}, valid_session
        expect(assigns(:session)).to be_a(Session)
        expect(assigns(:session)).to be_persisted
      end

      it "redirects to the created session" do
        post :create, {:machine_id => machine.id, :session => valid_attributes}, valid_session
        expect(response).to redirect_to(machine_session_url(machine, Session.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved session as @session" do
        post :create, {:machine_id => machine.id, :session => invalid_attributes}, valid_session
        expect(assigns(:session)).to be_a_new(Session)
      end

      it "re-renders the 'new' template" do
        post :create, {:machine_id => machine.id, :session => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {machine_id: machine.id, name: 'updated'}
      }

      it "updates the requested session" do
        session = Session.create! valid_attributes
        put :update, {:machine_id => machine.id, :id => session.to_param, :session => new_attributes}, valid_session
        session.reload
        expect(session.name).to eq('updated')
      end

      it "assigns the requested session as @session" do
        session = Session.create! valid_attributes
        put :update, {:machine_id => machine.id, :id => session.to_param, :session => valid_attributes}, valid_session
        expect(assigns(:session)).to eq(session)
      end

      it "redirects to the session" do
        session = Session.create! valid_attributes
        put :update, {:machine_id => machine.id, :id => session.to_param, :session => valid_attributes}, valid_session
        expect(response).to redirect_to(machine_session_url(machine, session))
      end
    end

    describe "with invalid params" do
      it "assigns the session as @session" do
        session = Session.create! valid_attributes
        put :update, {:machine_id => machine.id, :id => session.to_param, :session => invalid_attributes}, valid_session
        expect(assigns(:session)).to eq(session)
      end

      it "re-renders the 'edit' template" do
        session = Session.create! valid_attributes
        put :update, {:machine_id => machine.id, :id => session.to_param, :session => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested session" do
      session = Session.create! valid_attributes
      expect {
        delete :destroy, {:machine_id => machine.id, :id => session.to_param}, valid_session
      }.to change(Session, :count).by(-1)
    end

    it "redirects to the sessions list" do
      session = Session.create! valid_attributes
      delete :destroy, {:machine_id => machine.id, :id => session.to_param}, valid_session
      expect(response).to redirect_to(machine_url(machine))
    end
  end

end
