class RelatsController < ApplicationController
  before_action :set_relat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if @relat.who != current_user.username.titleize
      if @relat.who.blank?
        if current_user.supervisor?
        else
          abort
        end
      else
        abort
      end
    end

    respond_to do |format|
      if @relat.update(relat_params)
        format.html { redirect_to @relat, notice: 'Responsável adicionado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_relat
      @relat = Relat.find(params[:id])
    end

    def relat_params
      params.require(:relat).permit(:who, :when, :board_id, :phase_id)
    end
end
