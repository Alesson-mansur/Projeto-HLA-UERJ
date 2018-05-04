class BoardnumsController < ApplicationController
  before_action :set_boardnum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    if params.has_key?(:q)
      @boardnums = Boardnum.search(params[:q]).order("created_at desc").page(params[:page]).per_page(10)
    else
      @boardnums = Boardnum.order("created_at desc").page(params[:page]).per_page(10)
    end
  end

  def show
  end

  def new
    @boardnum = Boardnum.new
  end

  def edit
  end

  def create
    @boardnum = Boardnum.new(boardnum_params)

    respond_to do |format|
      if @boardnum.save
        format.html { redirect_to @boardnum, notice: 'Cadastro de número de placa realizado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @boardnum.update(boardnum_params)
        format.html { redirect_to @boardnum, notice: 'Atualização de número de placa feita com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @boardnum.destroy
        format.html { redirect_to boardnums_url, notice: 'Cadastro excluído com sucesso.' }
      else
        format.html { redirect_to boardnums_url, notice: 'Cadastro não pode ser deletado porque há amostras endereçadas à respectiva placa.' }
      end    
    end
  end

  private
    def set_boardnum
      @boardnum = Boardnum.find(params[:id])
    end

    def boardnum_params
      params.require(:boardnum).permit(:identification)
    end
end
