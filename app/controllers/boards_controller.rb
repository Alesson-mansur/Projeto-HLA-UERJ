class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params.has_key?(:q)
      @boards = Board.search(params[:q]).order('created_at desc').page(params[:page]).per_page(10)
    else
      @boards = Board.order('created_at desc').page(params[:page]).per_page(10)
    end
  end

  def show
    #Permitir o download em formato pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "mapa",
               template: "layouts/mapa.html.erb",
               locals: {:board => @board},
               layout: "mapa.html",
               orientation: 'Landscape',
               margin:  {   top:               5,
                            bottom:            5,
                            left:              5,
                            right:             5 },
               footer: { right: 'Pg. [page] de [topage]' }
      end
    end
  end

  def new
    #método pra recuperar os nums de dna de algum mapa deletado para um novo
    #e só mostrar as opções que ainda não estão em nenhum mapa
    @aux = [0, 0, 0]
    count = 0
    Board.without_deleted.each do |psp|
      @aux[count] = psp.identification
      count = count + 1
    end

    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        
        #método para passar as ids dos dna_nums para o mapa automaticamente
        dnanums = Dnanum.all
        prs = @board
        count = 0
        exp = ['', '', '']
        dnanums.each do |qwer|
          if (@board.identification == qwer.boardnum.identification)
            exp[count] = qwer.id
            count = count + 1
          end
        end           
        prs.update!(dnanum_ids: exp) 

        #Associar username ao mapa
        @signature = Signature.create(uname: current_user.username.to_s, board_id: @board.id)
        #Criar Etapas e Reagentes associados ao mapa
        @phase = Phase.create(board_id: @board.id)
          #Criar as fases dos processos
          @pcr = Pcr.create(board_id: @board.id, phase_id: @phase.id)
          @eletroforese = Eletroforese.create(board_id: @board.id, phase_id: @phase.id)
          @hibrid = Hibrid.create(board_id: @board.id, phase_id: @phase.id)
          @interp = Interp.create(board_id: @board.id, phase_id: @phase.id)
          @interpret = Interpret.create(board_id: @board.id, phase_id: @phase.id)
          @relat = Relat.create(board_id: @board.id, phase_id: @phase.id)
        @reagent = Reagent.create(board_id: @board.id)
        @report = Report.create(board_id: @board.id, phase_id: @phase.id, reagent_id: @reagent.id)
        
        format.html { redirect_to @board, notice: 'Mapa criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @board.destroy
        format.html { redirect_to boards_url, notice: 'Mapa apagado com sucesso.' }
      else
        format.html { redirect_to boards_url, notice: 'Mapa não pode ser deletado porque o período de edição/deleção já expirou.' }
      end
    end
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:identification, :boardnum_id, :dnanum_ids => [])
    end
end
