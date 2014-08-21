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

  Accela::Configuration.app_id = "635395466279594650"
  Accela::Configuration.app_secret = "3b1e4026d95e4478a0f8dd1f7a1b7028"
  Accela::Configuration.agency = "islandton"
  Accela::Configuration.environment = "TEST"

end
