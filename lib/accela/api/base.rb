module Accela
  class API
    module Base

      def handle(response)
        Handler.handle(response)
      end

    end
  end
end
