require 'dm-core'
require 'dm-migrations'

module DynamicDatabase
  ADAPTERS = {}
  TABLES = {}
  # this is the datamapper default
  DEFAULT_NAMING = DataMapper::NamingConventions::Resource::UnderscoredAndPluralized
  # the naming convention will be cached per repo so don't bother using a lambda
  NAMING_CONVENTION = lambda do |name|
    TABLES[name] ? TABLES[name] : DEFAULT_NAMING.call(name)
  end

  def self.shard(name, &block)
    context = name.downcase.to_sym
    unless ADAPTERS[context]
      # connect with the new repository
      ADAPTERS[context] = DataMapper.setup(context, url(name))
      ADAPTERS[context].resource_naming_convention = NAMING_CONVENTION

      # auto upgrading a repository doesn't work as each model has a default repository and I haven't found a
      # way yet to change those dynamically per client. Questions is, if we would want to do this?
      #DataMapper.auto_upgrade!(context)
    end

    # use the existing connection to the db shard
    DataMapper.repository(context, &block)
  end

  def self.url(name)
    #"mysql://root:root@localhost/#{name}"
    "sqlite3://" + Padrino.root('db', "#{name.downcase}.db")
  end
end