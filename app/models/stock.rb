require 'date'

class Stock < ActiveRecord::Base
  self.table_name = 'stock'

  def simiType
    diff = Time.now - self.entryTime.to_time

    if ((diff / 60) > 120)
      2
    elsif ((diff / 60) > 40)
      1
    else
      0
    end
  end

  def self.start_time simi_type
    time = Time.now
    if simi_type.to_i == 1
      time - 40*60
    elsif simi_type.to_i == 0
      time
    else
      time - 120*60
    end
  end

  def self.interval_time simi_type
    if simi_type.to_i == 1
      120*60
    elsif simi_type.to_i == 0
      40*60
    else
      nil
    end
  end
end
