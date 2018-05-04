class SignaturesController < ApplicationController
  before_action :set_signature, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @signature = Signature.new
  end

  def edit
  end

  def create
    @signature = Signature.new(signature_params)

    respond_to do |format|
      if @signature.save
        format.html { redirect_to @signature, notice: 'Signature was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @signature.update(signature_params)
        format.html { redirect_to @signature, notice: 'Signature was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @signature.destroy
    respond_to do |format|
      format.html { redirect_to signatures_url, notice: 'Signature was successfully destroyed.' }
    end
  end

  private
    def set_signature
      @signature = Signature.find(params[:id])
    end

    def signature_params
      params.require(:signature).permit(:uname, :dnanum_id, :board_id)
    end
end
