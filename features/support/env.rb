# This file provides setup and common functionality across all features.  It's
# included first before every test run, and the methods provided here can be 
# used in any of the step definitions used in a test.  This is a great place to
# put shared data like the location of your app, the capabilities you want to
# test with, and the setup of selenium.

require 'rspec/expectations'
require 'appium_lib'
require 'cucumber'
require 'require_all'
require 'allure-cucumber'
require 'yaml'
require_rel '../pages'

include AllureCucumber::DSL

$failed_scenarios = false
# Initialize appium
# begin
# appium_txt = File.join(Dir.pwd, 'features/support/appium.txt')
# caps = Appium.load_appium_txt file: appium_txt, verbose: true
# Appium::Driver.new(caps)
# Appium.promote_appium_methods Pages
# Appium.promote_singleton_appium_methods Pages
# rescue
#   puts "NO App loaded"
#   raise
# end
begin
case ENV['UI']
  when 'UI'
  appium_txt = File.join(Dir.pwd, 'features/support/standard_port/appium.txt')
  caps = Appium.load_appium_txt file: appium_txt, verbose: true
    puts 'Test use appium.txt'
  when 'device'
    appium_txt = File.join(Dir.pwd, 'features/support/ios_device/appium.txt')
    caps = Appium.load_appium_txt file: appium_txt, verbose: true
    puts 'Test use appium.txt'
  when 'latest'
    appium_txt = File.join(Dir.pwd, 'features/support/latest_sim/appium.txt')
    caps = Appium.load_appium_txt file: appium_txt, verbose: true
    puts 'Test use appium.txt'
else
  puts "I'm starting test in non default port"
  appium_txt = File.join(Dir.pwd, 'features/support/non_standard_port/appium.txt')
  caps = Appium.load_appium_txt file: appium_txt, verbose: true
# else
#   caps = Appium.load_appium_txt file: File.expand_path('./', __FILE__), verbose: true
end
Appium::Driver.new(caps)
  puts caps
Appium.promote_appium_methods Pages
Appium.promote_singleton_appium_methods Pages
end

# setup env test/dev
environment = ENV['ENVIRONMENT']

# Environment is specified in the cucumber.yml file (see ENVIRONMENT=...)
case ENV['ENVIRONMENT'].downcase
  when 'local'
    $price_finder_url = 'https://yja4di74w4.execute-api.ap-southeast-2.amazonaws.com'
    $environment_test_data_file = './features/support/data/MyerOneDev.yml'
    $pf_headers = { 'Content-Type' => 'application/json', 'x-api-key' => 'gvkduJjuum8z5K4jww3794QEdVGmjfjV9uC6L8cP' }
    $auth_url = "https://myerone-app-auth-api-local.myer-services.com.au"
    $myer_visa_url = "https://uyqls3sjd7.execute-api.ap-southeast-2.amazonaws.com"
  # raise "Running in this environment: #{ENV['ENVIRONMENT'].downcase}"
  when 'dev'
    $environment_test_data_file = './features/support/data/MyerOneDev.yml'
    $price_finder_url = 'https://yja4di74w4.execute-api.ap-southeast-2.amazonaws.com'
    $pf_headers = { 'Content-Type' => 'application/json', 'x-api-key' => 'gvkduJjuum8z5K4jww3794QEdVGmjfjV9uC6L8cP' }
    puts $auth_url
    $auth_url = "https://myerone-app-auth-api-dev.myer-services.com.au"
    # raise "Running in this environment: #{ENV['ENVIRONMENT'].downcase}"
  when 'test'
    $environment_test_data_file = './features/support/data/MyerOneTest.yml'
    $price_finder_url = 'https://mgsxbzxf14.execute-api.ap-southeast-2.amazonaws.com/test'
    $pf_headers = { 'Content-Type' => 'application/json', 'x-api-key' => 'm0N3wnQ6Ce3SkHGYXeeEI9cDEapWrD424mV1AZ3R' }
    $auth_url = "https://myerone-app-auth-api-test.myer-services.com.au"
    # raise "Running in this environment: #{ENV['ENVIRONMENT'].downcase}"
  # when 'prod'
  #   $environment_test_data_file = './features/support/data/MyerOneProd.yml'
  when 'prod'
    $environment_test_data_file = './features/support/data/MyerOneTest.yml'
    $price_finder_url = 'https://yja4di74w4.execute-api.ap-southeast-2.amazonaws.com'
    $pf_headers = { 'Content-Type' => 'application/json', 'x-api-key' => 'gvkduJjuum8z5K4jww3794QEdVGmjfjV9uC6L8cP' }
    $auth_url = "https://myerone-app-auth-api-prod.myer-services.com.au"
  else
    raise "Environment is not valid: #{ENV['ENVIRONMENT'].downcase}, valid enviroments are local, dev, test or prod"
end

#World(Pages::Common)

# Load data files
ENV_DATA = YAML.load_file($environment_test_data_file)


module MY_ENV
  class << self
  def current_env
    @my_env ||= ENV['ENVIRONMENT'].downcase
  end
    end
end


