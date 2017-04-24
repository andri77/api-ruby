# Global hooks

at_exit do
  exit_status = $!.status if $!.is_a?(SystemExit)

  # exec  'echo "Exiting cucumber"; echo ${exit_status} ; ./stop_appium.sh'
  #puts "Cucumber.wants_to_quit"
  #puts Cucumber.wants_to_quit
  # puts exit_status
  if $failed_scenarios
    puts "Any scenario fail? #{$failed_scenarios}"
    exec 'echo "exit_status not 0" ;'
  else
    puts "Any scenario fail? #{$failed_scenarios}"
    exec 'echo "exit_status 0" ;'
  end
  # exec './stop_appium.sh'
  #exit exit_status if
  #exit 1 if Cucumber.wants_to_quit
end

Before()  {
  # cleanup report directories
  FileUtils.rm_rf(%w{reports screenshots allure-report gen})

  # create screenshots and reports directory
  screenshots_dir = "./screenshots"
  reports_dir = "./reports"
  Dir.mkdir(screenshots_dir) unless File.exists?(screenshots_dir)
  Dir.mkdir(reports_dir) unless File.exists?(reports_dir)
}

After do |scenario|

  if scenario.failed?
    puts "(After Hook after scenario fail): Any scenario fail? #{$failed_scenarios}"
    # take screenshot in case of failure
    # name = UUID.new.generate+".png"
    # $driver.screenshot("./screenshots/#{name}")
    #scenario.attach_file("screenshot", File.new("./screenshots/#{name}"))
    # Cucumber.wants_to_quit = true
    $failed_scenarios = true
    # name = UUID.new.generate+".png"
    # $driver.screenshot("./screenshots/#{name}")
  end
  puts "(After Hook with no fail): Any scenario fail? #{$failed_scenarios}"
  # puts "Kill all Simulator"
  # system('killall Simulator')
end