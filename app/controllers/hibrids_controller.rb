class HibridsController < ApplicationController
  before_action :set_hibrid, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if @hibrid.who != current_user.username.titleize
      if @hibrid.who.blank?
      else
        abort
      end
    end

    respond_to do |format|
      if @hibrid.update(hibrid_params)
        format.html { redirect_to @hibrid, notice: 'Responsável adicionado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_hibrid
      @hibrid = Hibrid.find(params[:id])
    end

    def hibrid_params
      params.require(:hibrid).permit(:who, :when, :board_id, :phase_id)
    end
end
