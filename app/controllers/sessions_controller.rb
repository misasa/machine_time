class SessionsController < ApplicationController
  before_action :set_machine
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    #@sessions = @machine.sessions
    params[:q] = Hash.new unless params[:q]
    params[:q][:machine_id_eq] = params[:machine_id]
    if params[:at]
      params[:q][:started_at_lteq] = params[:at]
      params[:q][:stopped_at_gteq] = params[:at]      
    end
    @q = Session.search(params[:q])
    @sessions = @q.result(distinct: true)
    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: @sessions }
      format.label { send_data(@sessions.to_label, filename: "machine_#{@machine.id}.label", type: 'text/label')  }
    end
    
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    respond_to do |format|
      format.html { render action: 'show' }
      format.json { render json: @session }
      format.label { send_data([@session].to_label, filename: "session_#{@session.id}.label", type: 'text/label')  }
    end
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to [@machine, @session], notice: 'Session was successfully created.' }
        format.json { render action: 'show', status: :created, location: @session }
      else
        format.html { render action: 'new' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to [@machine, @session], notice: 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to machine_url(@machine) }
      format.json { head :no_content }
    end
  end

  private
    def set_machine
      @machine = Machine.find(params[:machine_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      par = params.require(:session).permit(:global_id, :number, :name, :description, :started_at, :stopped_at, :machine_id, :user_id)
      par[:started_at] =  DateTime.strptime(par[:started_at], "%Y-%m-%dT%T.%L%z")
      par[:stopped_at] =  DateTime.strptime(par[:stopped_at], "%Y-%m-%dT%T.%L%z") if par[:stopped_at]
      par
    end
end
