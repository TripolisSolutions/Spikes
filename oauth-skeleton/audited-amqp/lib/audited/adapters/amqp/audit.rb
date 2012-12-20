require 'set'
require 'audited/audit'

module Audited
  module Adapters
    module AMQP
      # Audit saves the changes to ActiveRecord models.  It has the following attributes:
      #
      # * <tt>auditable</tt>: the ActiveRecord model that was changed
      # * <tt>user</tt>: the user that performed the change; a string or an ActiveRecord model
      # * <tt>action</tt>: one of create, update, or delete
      # * <tt>audited_changes</tt>: a serialized hash of all the changes
      # * <tt>comment</tt>: a comment set with the audit
      # * <tt>created_at</tt>: Time that the change was performed
      #
      class Audit < ::ActiveResource::Base
        extend ActiveModel::Callbacks
        define_model_callbacks :create
        define_model_callbacks :update
        define_model_callbacks :destroy
        cattr_accessor :queue

        def self.belongs_to(m, options = {})
          self.class_eval <<END_BELONGS_TO
          def #{m}
            @#{m} ||= #{m}.constantize.find(#{m}_id) if #{m}_id
          end

          def #{m}=(_#{m})
            #{m}_id = _#{m}.id
            #{m}_type = #{m}.model_name
          end
          attr_accessor :#{m}_id, :#{m}_type
END_BELONGS_TO
        end

        def self.attr_accessible(*params); end
        def self.transaction; yield; end
      

        include Audited::Audit

        schema do
          integer :auditable_id, :associated_id, :user_id, :client_id
          string :auditable_type, :associated_type, :user_type, :username
          string :action, :comment, :remote_address
          integer :version
          datetime :created_at

          string :audited_changes
        end
        # attr_accessible :audited_changes

        # default_scope         order(:version)
        # scope :descending,    reorder("version DESC")
        # scope :creates,       :conditions => {:action => 'create'}
        # scope :updates,       :conditions => {:action => 'update'}
        # scope :destroys,      :conditions => {:action => 'destroy'}

        # scope :up_until,      lambda {|date_or_time| where("created_at <= ?", date_or_time) }
        # scope :from_version,  lambda {|version| where(['version >= ?', version]) }
        # scope :to_version,    lambda {|version| where(['version <= ?', version]) }

        # # Return all audits older than the current one.
        # def ancestors
        #   self.class.where(['auditable_id = ? and auditable_type = ? and version <= ?',
        #     auditable_id, auditable_type, version])
        # end

        def user=(user)
          user_id = user.id
          username = user.id
          user_type = user.model_name
          client_id = user.client_id
        end

        def initialize(attrs = {}, persisted = false)
          h = {}
          a = attrs.dup.delete_if do |k, v|
            if v.kind_of? Hash
              h[k] = v
              true
            else
              false
            end
          end
          super(a, persisted).tap{|o| h.each {|k, v| o.attributes[k] = v}}
        end

        def []=(obj, val)
          attributes[obj] = val
        end

        def save(params)
          self.created_at = Time.now
          AMQPManager.send_message(self.to_json, nil, @@queue)
        end

        private
        def set_version_number
        end
      end
    end
  end
end
