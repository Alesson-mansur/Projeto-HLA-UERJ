class InterpsController < ApplicationController
  before_action :set_interp, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if @interp.who != current_user.username.titleize
      if @interp.who.blank?
      else
        abort
      end
    end

    respond_to do |format|
      if @interp.update(interp_params)
        format.html { redirect_to @interp, notice: 'Responsável adicionado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_interp
      @interp = Interp.find(params[:id])
    end

    def interp_params
      params.require(:interp).permit(:who, :when, :board_id, :phase_id)
    end
end
