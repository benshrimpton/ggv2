module Teamwork

  BASE_URL = 'https://cloudwksvs.appspot.com/externalapi/'
  TEST_ACCESS_TOKEN = 'anJ1ZGVzdGVzdCA1NzM0MDU1MTQ0MzI1MTIwIHJGWTBCcWZJUGdkTTg3Ukc5TWlOUnRMZlFxR3V2WFo3'
  PRODUCTION_ACCESS_TOKEN = 'amVmZnJleV9ydWRlcyA1NzIwMTQ3MjM0OTE0MzA0IHhVdTBMVWVEMHRTOHdUSlBWdHNwZDczRU1mc29odkh1'

  def self.call(function_name, data = {})
    response = HTTParty.post(
        "#{BASE_URL}#{function_name}",
        headers: { 'Access-Token' => access_token },
        body: data.to_json
    )

    data = JSON.parse(response.body)
    data = convert_hash_keys(data)

    if data[:error]
      raise "#{data[:error]}: #{data[:message]}"
    else
      return data
    end
  end

  # Convert camelCase hash keys to snake_case.
  #
  # @return [Hash]
  def self.convert_hash_keys(value)
    case value
      when Array
        value.map { |v| convert_hash_keys(v) }
      when Hash
        Hash[value.map { |k, v| [k.to_s.underscore.to_sym, convert_hash_keys(v)] }]
      else
        value
    end
  end

  def self.access_token
    Rails.env.production? ? PRODUCTION_ACCESS_TOKEN : TEST_ACCESS_TOKEN
  end

end
