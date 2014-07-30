unless defined?(INTEGRATION_SPEC_HELPER_LOADED)
  INTEGRATION_SPEC_HELPER_LOADED = true
  require File.dirname(__FILE__) + "/../spec_helper"

  require "vcr"
  require "webmock"

  VCR.configure do |c|
    c.cassette_library_dir = File.dirname(__FILE__) + "/../cassettes"
    c.hook_into :webmock
    c.configure_rspec_metadata!
  end
end
