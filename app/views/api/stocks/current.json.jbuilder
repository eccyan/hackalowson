json.array!(@stocks) do |stock|
  json.extract! stock, :id, :storeId, :odenId, :number, :available, :entryTime, :recordedTime, :simiType
  json.url api_store_stock_url(stock.storeId, stock, format: :json)
end
