module Accela
  class Authorize
    attr_reader :app_id, :app_secret, :agency, :environment

    def initialize(app_id, app_secret, agency, environment)
      @app_id = app_id
      @app_secret = app_secret
      @agency = agency
      @environment = environment
    end

    def login(username, password, scope)
      complete_body = body.merge({
        "username" => username,
        "password" => password,
        "scope" => scope
      })

      response = HTTParty.post("https://apis.accela.com/oauth2/token",
                               headers: headers,
                               body: complete_body)
      if response.code == 200
        Token.new(response.parsed_response)
      end
    end

    private

    def headers
      headers = {
        "Content-Type" => "application/x-www-form-urlencoded",
        "x-accela-appid" => "abcd"
      }
    end

    def body
      body =  {
        "grant_type" => "password",
        "agency_name" => agency,
        "environment" => environment,
        "client_id" => app_id,
        "client_secret" => app_secret
      }
    end

  end
end
