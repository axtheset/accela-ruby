module Accela
  class Authorize
    attr_reader :app_id, :app_secret, :agency, :environment

    def initialize(app_id, app_secret, agency, environment)
      @app_id = app_id
      @app_secret = app_secret
      @agency = agency
      @environment = environment
    end

  end
end
