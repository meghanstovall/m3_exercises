require 'faraday'
require 'json'
require 'digest'

class MarvelService

  # public - 202da12b34ea7bae761430ede93aa931

  # private - aa2f78c63fe1c54c716de3a701bc5597d0e5aa2d

  def character(name)
    get_json("/v1/public/characters?apikey=202da12b34ea7bae761430ede93aa931&hash=#{hash_digest}&ts=#{timestamp}&name=#{name}")
  end

  def creators(attributes)
    if attributes.keys.first == :last_name
      last_name = attributes[:last_name]
      get_json("/v1/public/creators?apikey=202da12b34ea7bae761430ede93aa931&hash=#{hash_digest}&ts=#{timestamp}&lastName=#{last_name}")
    else
      first_name = attributes[:first_name]
      get_json("/v1/public/creators?apikey=202da12b34ea7bae761430ede93aa931&hash=#{hash_digest}&ts=#{timestamp}&firstName=#{first_name}")
    end
  end

  private
    def timestamp
      Time.now.to_i
    end

    def hash_digest
      private_key = "aa2f78c63fe1c54c716de3a701bc5597d0e5aa2d"
      public_key = "202da12b34ea7bae761430ede93aa931"
      Digest::MD5.hexdigest "#{timestamp}#{private_key}#{public_key}"
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body)
      # JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "https://gateway.marvel.com")
    end
end
