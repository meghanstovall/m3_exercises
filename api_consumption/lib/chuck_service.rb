require 'faraday'
require 'json'

class ChuckService

  def random
    get_json("/jokes/random")
  end

  def random_in_category(category)
    get_json("/jokes/random?category=#{category}")
  end

  def categories
    get_json("/jokes/categories")
  end

  def search(word)
    get_json("/jokes/search?query=#{word}")
  end

  private
    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body)
      # JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "https://api.chucknorris.io")
    end
end
