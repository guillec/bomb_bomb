require "bomb_bomb/version"
require "net/http"
require "json"

module BombBomb

  class API
    def initialize(email, pw)
      @email = email
      @pw    = pw
    end

    def call(method, args)
      parsed_response = make_call(method, args)
      parsed_response
    end

    def method_missing(method, *args)
      method = camelize_method(method)
      call(method, args)
    end

    private
    def param_fields(args)
      params          = {}
      params["email"] = @email
      params["pw"]    = @pw
      params          = args.first.merge(params) if args.first
      params
    end

    def make_call(method, args)
      uri = URI("https://app.bombbomb.com/app/api/api.php?method=#{method}")
      response = Net::HTTP.post_form(uri, param_fields(args))
      JSON.load("[#{response.body}]").first
    end

    def camelize_method(method)
      method = method.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
      testmethod = method[0].chr.upcase + method[1..-1]
    end
  end
end
