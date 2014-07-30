unless defined?(SPEC_HELPER_LOADED)
  SPEC_HELPER_LOADED = true

  project_root = File.expand_path(File.dirname(__FILE__) + "/..")
  require "rubygems"
  require "bundler/setup"
  require "httparty"
  require "pry"

  accela_lib = "#{project_root}/lib"
  $LOAD_PATH << accela_lib
  require "accela"
end
