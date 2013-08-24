json.array!(@stocks) do |stock|
  json.extract! stock, :id, :storeId, :odenId, :number, :available, :entryTime, :recordedTime
  json.url stock_url(stock, format: :json)
end
