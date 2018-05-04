class PhasesController < ApplicationController
  before_action :set_phase, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @phases = Phase.order("created_at desc").page(params[:page]).per_page(10)
  end

  def show
  end

  def edit
    @users = User.all
  end

  def create
    @phase = Phase.new(phase_params)

    respond_to do |format|
      if @phase.save
        format.html { redirect_to @phase, notice: 'Etapa criada com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to @phase, notice: 'Etapa(s) atualizada(s) com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @phase.destroy
    respond_to do |format|
      format.html { redirect_to phases_url, notice: 'Phase was successfully destroyed.' }
    end
  end

  private
    def set_phase
      @phase = Phase.find(params[:id])
    end

    def phase_params
      params.require(:phase).permit(:base, :negativo, :positivo, :opt1, :opt2, :board_id)
    end
end
