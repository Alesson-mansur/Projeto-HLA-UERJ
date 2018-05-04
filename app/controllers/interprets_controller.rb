class InterpretsController < ApplicationController
  before_action :set_interpret, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if @interpret.who != current_user.username.titleize
      if @interpret.who.blank?
      else
        abort
      end
    end

    respond_to do |format|
      if @interpret.update(interpret_params)
        format.html { redirect_to @interpret, notice: 'Responsável adicionado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_interpret
      @interpret = Interpret.find(params[:id])
    end

    def interpret_params
      params.require(:interpret).permit(:who, :when, :board_id, :phase_id)
    end
end
