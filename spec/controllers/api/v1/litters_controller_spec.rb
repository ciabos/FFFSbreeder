describe Api::V1::LittersController , type: :request do
  describe "#index" do
    it "returns all litters with their animals" do
      breeder = create(:breeder)
      litter = create(:litter, breeder: breeder)
      create_list(:animal, 5, litter: litter)

      auth_headers = breeder.create_new_auth_token
      get "/api/v1/litters", headers: auth_headers

      expect(json["data"][0]["attributes"]["name"]).to eq(litter.name)
      expect(json["data"][0]["relationships"]).to include(
        "breeder", "mother", "father", "animals"
      )
      expect(json["included"].size).to eq 8 # breeder, father, mother and 5 animals
    end
  end

  describe "#show" do
    it "returns litter and it's animals" do
      breeder = create(:breeder)
      litter = create(:litter, breeder: breeder)
      create_list(:animal, 2, litter: litter)

      auth_headers = breeder.create_new_auth_token
      get "/api/v1/litters/#{litter.id}", headers: auth_headers

      expect(json["data"]["attributes"]["name"]).to eq(litter.name)
      expect(json["data"]["relationships"]).to include("breeder", "animals", "father", "mother")
      expect(json["included"].size).to eq 5
    end
  end

  describe "#create" do
    it "creates litter" do
      breeder = create(:breeder)

      auth_headers = breeder.create_new_auth_token
      birth_date = Time.zone.now
      expect {
        post "/api/v1/litters", headers: auth_headers, params: {
          litter: {
            name: "litter 1",
            birth_date: birth_date,
            expected_traits: ["tall", "thin"]
          }
        }
      }.to change(Litter, :count).by(1)
      litter = Litter.last
      expect(litter.name).to eq("litter 1")
    end
  end

  def json
    JSON.parse(response.body)
  end
end
