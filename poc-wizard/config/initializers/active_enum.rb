# Form helper integration
require 'active_enum/form_helpers/simple_form'
# require 'active_enum/form_helpers/formtastic

ActiveEnum.setup do |config|

  # Extend classes to add enumerate method
  # config.extend_classes = [ ActiveRecord::Base ]

  # Return name string as value for attribute method
  #config.use_name_as_value = true

  # Storage of values
  config.storage = :i18n

end

# ActiveEnum.define do
# 
#   enum(:enum_name) do
#     value 1 => 'Name'
#   end
# 
# end
