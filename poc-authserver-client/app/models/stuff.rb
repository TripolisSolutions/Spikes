class Resource < ActiveResource::Base
  Resource.site = "http://localhost:3002/"

  class << self
    # If headers are not defined in a given subclass, then obtain
    # headers from the superclass.
    def headers
      if defined?(@headers)
        @headers
      elsif superclass != Object && superclass.headers
        superclass.headers
      else
        @headers ||= {}
      end
    end
  end
end

class Stuff < Resource
  schema do
    attribute 'name', :string
  end
end
