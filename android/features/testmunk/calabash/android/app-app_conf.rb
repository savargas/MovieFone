if ENV['APP_APP']

  AfterConfiguration do |config|
    @@multiple = false

    if ENV['ADB_DEVICE_ARG'].nil? && !ENV['D2'].nil? && !ENV['D1'].nil?
      @@multiple = true
      ENV['ADB_DEVICE_ARG']=ENV['D1']
      @@device1 = Calabash::Android::Operations::Device.new(self, ENV["D1"], "34801",
                                                            ENV["APP_PATH"], ENV["TEST_APP_PATH"], 7103)
      @@device2 = Calabash::Android::Operations::Device.new(self, ENV["D2"], "34802",
                                                            ENV["APP_PATH"], ENV["TEST_APP_PATH"], 7104)
    end
  end

  Before do |scenario|
    if @@multiple
      extend Calabash::Android::Operations
      @@device2.reinstall_apps
      @@device2.start_test_server_in_background

      @@device1.reinstall_apps
      @@device1.start_test_server_in_background
      set_default_device(@@device1)
    else
      start_test_server_in_background
    end
  end

  After do |scenario|
    if @@multiple
      @@device1.shutdown_test_server
      @@device2.shutdown_test_server
    else
      shutdown_test_server
    end
  end

end