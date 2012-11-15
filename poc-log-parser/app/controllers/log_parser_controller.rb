require 'apache_log_regex'
require 'ua-tools/user_agent'
require 'lazy_high_charts/high_chart'
require 'geoip'

class LogParserController < ApplicationController
  def index
    @operating_systems = Hash.new(0)
    @devices = Hash.new(0)
    @countries = Hash.new(0)
    @cities = Hash.new(0)
    read_and_parse_log_file()
    @operating_systems = Hash[@operating_systems.sort_by{|k,v| v}.reverse]
    @devices = Hash[@devices.sort_by{|k,v| v}.reverse]
    create_os_chart()
    create_device_chart()
    @countries = Hash[@countries.sort_by{|k,v| v}.reverse]
    @cities = Hash[@cities.sort_by{|k,v| v}.reverse]
  end

  def create_device_chart
    @device_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({:text => "Device types"})
      f.options[:chart][:defaultSeriesType] = "column"
      f.xAxis(:categories => @devices.keys)
      f.series(:name => 'Impressions', :data => @devices.values)
    end
  end

  def create_os_chart
    @os_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({:text => "Operating systems"})
      f.options[:chart][:defaultSeriesType] = "column"
      f.xAxis(:categories => @operating_systems.keys)
      f.series(:name => 'Impressions', :data => @operating_systems.values)
    end
  end

  def read_and_parse_log_file
    format = '%h %l %u %t \"%r\" %>s %b \"%{referer}i\" \"%{User-Agent}i\"'
    parser = ApacheLogRegex.new(format)
    File.foreach("#{Rails.root}/app/assets/logs/favicon.log") do |line|
      begin
        results = parser.parse(line)
        user_agent = UaTools::UserAgent.new(results['%{User-Agent}i'])
        @operating_systems[user_agent.os.platform] += 1
        @devices[user_agent.os.device] += 1
        ip = results['%h']
        country_and_city_from_ip(ip)
      rescue ApacheLogRegex::ParseError => e
        puts "Error parsing log file: " + e.message
      end
    end
  end

  def country_and_city_from_ip(host)
    geoip_result = GeoIP.new("#{Rails.root}/vendor/assets/data/GeoLiteCity.dat").city(host)
    @countries[geoip_result.country_name] += 1 if geoip_result &&
    @cities[geoip_result.city_name] += 1 if geoip_result && geoip_result.city_name
  end

end
