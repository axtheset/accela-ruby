module Accela
  class Token
    attr_reader :access_token,
                :token_type,
                :expires_in,
                :refresh_token,
                :scope

    def initialize(input, created_at=DateTime.now)
      @access_token = input.fetch("access_token")
      @token_type = input.fetch("token_type")
      @expires_in = input.fetch("expires_in").to_i
      @refresh_token = input.fetch("refresh_token")
      @scope = input.fetch("scope")
      @created_at = created_at
    end

    def expires_at
      add_seconds_to_date(created_at, expires_in)
    end

    def expired?(now=DateTime.now)
      expires_at <= now
    end

    private

    def created_at
      @created_at
    end

    def add_seconds_to_date(date, seconds)
      seconds_in_day = 86400
      date + Rational(seconds, seconds_in_day)
    end

  end
end
