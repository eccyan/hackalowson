# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Change Auto record
module ActiveRecord
  module Timestamp
    private
    def timestamp_attributes_for_update #:nodoc:
      [:updated_at]
    end

    def timestamp_attributes_for_create #:nodoc:
      [:recordedTime, :created_at]
    end
  end
end

# Initialize the Rails application.
Hackalowson::Application.initialize!
