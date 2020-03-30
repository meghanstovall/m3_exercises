require './spec/spec_helper'

describe MarvelService do
  before(:each) do
    @marvel = MarvelService.new
  end

  it 'exists' do
    expect(@marvel).to be_a(MarvelService)
  end

  it 'can get character info by name' do
    c = @marvel.character("hulk")

    expect(c).to have_key("data")
    expect(c["data"]["results"].first["name"]).to eq("Hulk")
    expect(c["data"]["results"].first).to have_key("description")
    expect(c["data"]["results"].first).to have_key("comics")
  end

  it 'can get a list of creators by last name' do
    c = @marvel.creators(last_name: "kirby")

    expect(c["data"]["results"].first["firstName"]).to eq("Jack")
  end

  it 'can get a list of creators by first name' do
    c = @marvel.creators(first_name: "brian")

    expect(c["data"]["results"][4]["lastName"]).to eq("Bendis")
  end
end
