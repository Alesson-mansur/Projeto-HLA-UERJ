class ReagentsController < ApplicationController
  before_action :set_reagent, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @reagents = Reagent.order("created_at desc").page(params[:page]).per_page(5)
  end

  def show
  end

  def edit
  end

  def create
    @reagent = Reagent.new(reagent_params)

    respond_to do |format|
      if @reagent.save
        format.html { redirect_to @reagent, notice: 'Reagent was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @reagent.update(reagent_params)
        format.html { redirect_to @reagent, notice: 'Reagentes atualizados com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @reagent.destroy
    respond_to do |format|
      format.html { redirect_to reagents_url, notice: 'Reagent was successfully destroyed.' }
    end
  end

  private
    def set_reagent
      @reagent = Reagent.find(params[:id])
    end

    
    def reagent_params
      params.require(:reagent).permit(:image, :amplific, :campo1, :campo2, :campo3, 
                                      :campo4, :campo5, :campo6, :campo7, :campo8, 
                                      :campo9, :campo10, :campo11, :campo12, :campo13, 
                                      :campo14, :campo15, :campo16, :campo17, :campo18,
                                      :campo19, :campo20, :campo21, :campo22, :campo23,
                                      :campo24, :data1, :data2, :data3, :data4, :data5, 
                                      :data6, :data7, :data8, :data9, :data12, :data13, 
                                      :data14, :data15, :data16, :data17, :data18, 
                                      :data19, :data20, :data23, :data24, 
                                      :obs, :board_id, :dnanum_ids => [])
    end
end
