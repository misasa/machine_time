class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :current_session, :edit, :update, :start, :stop, :destroy]

  # GET /machines
  # GET /machines.json
  def index
    @machines = Machine.all
  end

  # GET /machines/1
  # GET /machines/1.json
  def show
  end

  # GET /machines/1/session
  # GET /machines/1/session.json
  # GET /machines/1/session.label
  def current_session
    respond_to do |format|
      if @machine.current_session
         format.html { render action: 'show' }
         format.json { render json: @machine.current_session }
         format.label { send_data([@machine.current_session].to_label, filename: "session_#{@machine.current_session.id}.label", type: "text/label") }
      else
         format.html { render action: 'show' }        
        format.json { render json: {} }    
      end
    end
  end


  # GET /machines/1/label
  def label
  end


  # GET /machines/new
  def new
    @machine = Machine.new
  end

  # GET /machines/1/edit
  def edit
  end

  # POST /machines
  # POST /machines.json
  def create
    @machine = Machine.new(machine_params)

    respond_to do |format|
      if @machine.save
        format.html { redirect_to @machine, notice: 'Machine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @machine }
      else
        format.html { render action: 'new' }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machines/1
  # PATCH/PUT /machines/1.json
  def update
    respond_to do |format|
      if @machine.update(machine_params)
        format.html { redirect_to @machine, notice: 'Machine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machines/1/start
  # PATCH/PUT /machines/1/start.json
  def start
    respond_to do |format|
      if @machine.start
        format.html { redirect_to @machine, notice: 'Machine was successfully started.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @machine, error: 'Machine can not be started.' }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /machines/1/start
  # PATCH/PUT /machines/1/start.json
  def stop
    respond_to do |format|
      if @machine.stop
        format.html { redirect_to @machine, notice: 'Machine was successfully stopped.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @machine, error: 'Machine can not be sttopped.' }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /machines/1
  # DELETE /machines/1.json
  def destroy
    @machine.destroy
    respond_to do |format|
      format.html { redirect_to machines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine
      @machine = Machine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_params
      params.require(:machine).permit(:name, :stage_name, :description, :session_prefix, :archiver_url)
    end
end
