class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :storeId
      t.integer :odenId
      t.integer :number
      t.boolean :available
      t.datetime :entryTime
      t.datetime :recordedTime
    end
  end
end
