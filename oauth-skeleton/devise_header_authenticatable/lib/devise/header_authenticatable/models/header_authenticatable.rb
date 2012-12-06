require 'devise/models'

module Devise
  module Models
    module HeaderAuthenticatable
      module ClassMethods
        Devise::Models.config(self)
      end
    end
  end
end
