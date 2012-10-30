require 'sinatra/base'
require 'active_record'
require 'sinatra/activerecord'
require 'yaml'


class App < Sinatra::Application

  set :root, File.expand_path(".")
  set :views, Proc.new { File.join(root, "/views") }
  set :public_folder,Proc.new { File.join(root, "/public") }

  ENV['RACK_ENV'] = 'development'
  dbconfig = YAML::load(File.open('config/database.yml'))['development']
  ActiveRecord::Base.establish_connection(dbconfig)
  ActiveRecord::Base.include_root_in_json = false


  #load all controller files
  #require File.join(root,'app/controllers/init')
  Dir[File.dirname(__FILE__) + '/app/controllers/**/*.rb'].each {|file| load file }
  #default UTF-8 encoding
  if defined? Encoding
    Encoding.default_external = Encoding::UTF_8
  end

    disable :protection
  enable :logging, :dump_errors, :raise_errors
end

#this will bootstrap any controller file which is defined in init.rb
require_relative 'app/controllers/init'


#hack for datamapper
class String
  def is_binary_data?
    ( self.count( "^ -~", "^\r\n" ).fdiv(self.size) > 0.3 || self.index( "\x00" ) ) unless empty?
  end
end