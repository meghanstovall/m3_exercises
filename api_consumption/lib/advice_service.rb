require 'faraday'
require 'json'

class AdviceService

  def random
    get_json("/advice")
  end

  def find(id)
    get_json("/advice/#{id}")
  end

  def search(word)
    get_json("/advice/search/#{word}")
  end

  private
    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body)
      # JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "https://api.adviceslip.com")
    end
end
