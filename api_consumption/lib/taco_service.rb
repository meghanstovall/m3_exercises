require 'faraday'
require 'json'

class TacoService

  def random_ingredients
    get_json("/random/")
  end

  def random_taco
    get_json("/random/?full-taco=true")
  end

  def contributors
    get_json("/contributors/base_layers/")
  end

  def contributions(username)
    get_json("/contributions/#{username}/")
  end

  def ingredients_by_type(ingredient)
    get_json("/contributors/#{ingredient}/")
  end

  def contributors_by_ingredient(layer, ingredient)
    get_json("/contributors/#{layer}/#{ingredient}/")
  end

  private
    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body)
      # JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "http://taco-randomizer.herokuapp.com")
    end
end
