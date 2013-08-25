class Api::StocksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    if store_id = params[:store_id]
      @stocks = Stock.where(storeId: store_id)
    else
      @stocks = Stock.all
    end
    @stocks = @stocks.order("recordedTime")

    oden_id = params[:oden_id]
    if oden_id 
      oden_ids = oden_id.split ","
      @stocks = @stocks.where odenId: oden_ids if oden_ids
    end
  end

  # GET /stocks/current
  # GET /stocks/current.json
  def current
    if store_id = params[:store_id]
      @stocks = Stock.where(storeId: store_id)
    else
      @stocks = Stock.all
    end

    @stocks = @stocks.order("entryTime DESC")
    @stocks = @stocks.group(:odenId)
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to [:api, @stock], notice: 'Stock was successfully created.' }
        format.json { render action: 'show', status: :created, location: [:api, @stock] }
      else
        format.html { render action: 'new' }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to [:api, @stock], notice: 'Stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to api_stocks_url }
      format.json { head :no_content }
    end
  end

  # GET /stocks/search
  # GET /stocks/search.json
  def search
    if store_id = params[:store_id] 
      @stocks = Stock.where storeId: store_id
    else
      @stocks = Stock.all
    end

    oden_id = params[:oden_id]
    if oden_id 
      oden_ids = oden_id.split ","
      @stocks = @stocks.where odenId: oden_ids if oden_ids
    end

    simi_type = params[:simi_type]
    start_time = @stocks.simi_start_time(simi_type)
    end_time = @stocks.simi_end_time(simi_type)

    if end_time
      @stocks = @stocks.where(entryTime: end_time.to_datetime..start_time.to_datetime)
    else
      @stocks = @stocks.where "entryTime <= ?", start_time.to_datetime
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      @stock_params = params.require(:stock).permit(:id, :odenId, :number, :available, :storeId, :entryTime, :recordedTime)
      @stock_params[:storeId] = params[:store_id] unless @stock_params[:storeId]
      @stock_params[:entryTime] = Time.now
      @stock_params
    end
end
