class Api::StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @stores = Stock.all
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @store = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @store = Stock.new(stock_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Stock was successfully created.' }
        format.json { render action: 'show', status: :created, location: @store }
      else
        format.html { render action: 'new' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @store.update(stock_params)
        format.html { redirect_to @store, notice: 'Stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:store).permit(:id, :storeId, :odenId, :number, :available, :entryTime, :recordedTime)
    end
end
