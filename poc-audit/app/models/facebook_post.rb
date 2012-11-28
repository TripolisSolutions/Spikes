class FacebookPost < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  store :post, accessors: [:url, :message, :name, :description, :event, :location, :when,
                          :question]

  audited allow_mass_assignment: true
end
