require 'active_record'
require 'audited/auditor'
require 'audited/adapters/amqp/audit'

module Audited::Auditor::ClassMethods
  def default_ignored_attributes
    [self.primary_key, inheritance_column]
  end
end

::ActiveRecord::Base.send :include, Audited::Auditor

Audited.audit_class = Audited::Adapters::AMQP::Audit

require 'audited/sweeper'
