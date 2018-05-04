class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @reports = Report.order('created_at desc').page(params[:page]).per_page(10)
  end

  def show
    #Permitir o download em formato pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "mapa_de_trabalho",
               template: "layouts/pdf.html.erb",
               locals: {:report => @report},
               layout: "pdf.html",
               orientation: 'Landscape',
               margin:  {   top:               10,
                            bottom:            5,
                            left:              5,
                            right:             5 },
               footer: { left: 'FOR-073REV06',
                        right: 'Pg. [page] de [topage]' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Relatório(s) adicionado(s) com sucesso.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:detail, :board_id, :phase_id, :reagent_id)
    end
end
