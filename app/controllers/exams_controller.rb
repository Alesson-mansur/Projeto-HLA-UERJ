class ExamsController < ApplicationController
  before_action :set_exam, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @exam = Exam.new
  end

  def edit
  end

  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exame criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exame atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exame foi excluído com sucesso.' }
    end
  end

  private
    def set_exam
      @exam = Exam.find(params[:id])
    end

    def exam_params
      params.require(:exam).permit(:kind)
    end
end
