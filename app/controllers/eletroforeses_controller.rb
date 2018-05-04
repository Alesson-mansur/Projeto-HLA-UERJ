class EletroforesesController < ApplicationController
  before_action :set_eletroforese, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if @eletroforese.who != current_user.username.titleize
      if @eletroforese.who.blank?
      else
        abort
      end
    end

    respond_to do |format|
      if @eletroforese.update(eletroforese_params)
        format.html { redirect_to @eletroforese, notice: 'Responsável adicionado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_eletroforese
      @eletroforese = Eletroforese.find(params[:id])
    end

    def eletroforese_params
      params.require(:eletroforese).permit(:who, :when, :board_id, :phase_id)
    end
end
