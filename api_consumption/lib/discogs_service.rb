require 'faraday'
require 'json'

class DiscogsService

  def releases_from_artist(artist)
    get_json("/database/search?q=#{artist}&token=MywGumXEwBpVmwQCUFHuGHIRlJdSGLUXxBHUndoM")
  end

  def release_rating(rating)
    get_json("/releases/#{rating}")
  end

  private
    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body)
      # JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "https://api.discogs.com")
    end
end
