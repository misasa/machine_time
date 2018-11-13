class TargetsController < ApplicationController
  before_action :set_session
  before_action :set_target, only: [:show, :edit, :update, :destroy]

  def create
    session_target = @session.session_targets.build
    session_target.target = Target.find_or_create_by_global_id(params[:target][:global_id])
    session_target.save!
    respond_to do |format|
      format.html { redirect_to machine_session_path(@session.machine, @session)  }
      format.json { head :no_content }
    end
  end

  def destroy
    session_target = @session.session_targets.find_by_target_id(@target.id)
    session_target.destroy if session_target
    respond_to do |format|
      format.html { redirect_to machine_session_path(@session.machine, @session)  }
      format.json { head :no_content }
    end
  end

  private
  def set_session
    @session = Session.find(params[:session_id])
  end
  
  def set_target
    @target = Target.find(params[:id])
  end

end
