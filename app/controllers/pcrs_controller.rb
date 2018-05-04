class PcrsController < ApplicationController
  before_action :set_pcr, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def show
  end
  
  def edit
  end

  def update
    if @pcr.who != current_user.username.titleize
      if @pcr.who.blank?
      else
        abort
      end
    end

    respond_to do |format|
      if @pcr.update(pcr_params)
        format.html { redirect_to @pcr, notice: 'Responsável adicionado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_pcr
      @pcr = Pcr.find(params[:id])
    end

    def pcr_params
      params.require(:pcr).permit(:who, :when, :board_id, :phase_id)
    end
end
