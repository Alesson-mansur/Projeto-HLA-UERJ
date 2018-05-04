class DnanumsController < ApplicationController
  before_action :set_dnanum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params.has_key?(:q)
      @dnanums = Dnanum.search(params[:q]).page(params[:page]).per_page(10)
    else
      @dnanums = Dnanum.order('created_at desc').page(params[:page]).per_page(10)
    end
  end
  
  def show
  end

  def new
    @dnanum = Dnanum.new
  end

  def edit
  end

  def create
    @dnanum = Dnanum.new(dnanum_params)

    respond_to do |format|
      if @dnanum.save
        @signature = Signature.create(uname: current_user.username.to_s, dnanum_id: @dnanum.id)
        format.html { redirect_to @dnanum, notice: 'Cadastro criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    aux = Signature.find_by_id(@dnanum.signature.id)

    respond_to do |format|
      if @dnanum.update(dnanum_params)
        aux.update!(uname: current_user.username.to_s)
        format.html { redirect_to @dnanum, notice: 'Cadastro atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @dnanum.destroy
        format.html { redirect_to dnanums_url, notice: 'Cadastro deletado com sucesso.' }
      else
        format.html { redirect_to dnanums_url, notice: 'Cadastro não pode ser deletado porque o período de edição/deleção já expirou.' }
      end
    end
  end

  private
    def set_dnanum
      @dnanum = Dnanum.find(params[:id])
    end

    def dnanum_params
      params.require(:dnanum).permit(:code, :option, :well, :exam_id, :boardnum_id)
    end
end
