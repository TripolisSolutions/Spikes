module OData
  class ODataException < StandardError
    def to_s
      "An unknown #{self.class.name.demodulize.to_s} has occured."
    end
  end
end

require "odata/abstract_schema"
require "odata/abstract_query"

require "odata/active_record_schema"
