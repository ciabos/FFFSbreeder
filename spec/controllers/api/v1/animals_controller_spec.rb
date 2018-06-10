describe Api::V1::AnimalsController , type: :request do
  describe "#show" do
    it "returns animal" do
      breeder = create(:breeder)
      litter = create(:litter, breeder: breeder)
      animal = create(:animal, litter: litter)

      auth_headers = breeder.create_new_auth_token
      get "/api/v1/animals/#{Animal.last.id}", headers: auth_headers

      expect(json["data"]["attributes"]["name"]).to eq(animal.name)
    end
  end

  describe "#create" do
    it "creates animal" do
      breeder = create(:breeder)
      litter = create(:litter, breeder: breeder)

      auth_headers = breeder.create_new_auth_token
      expect {
        post "/api/v1/animals", headers: auth_headers, params: {
          animal: {
            name: "animal 1",
            sex: "male",
            home_name: "test home",
            litter_id: litter.id
          }
        }
      }.to change(Animal, :count).by(1)
      animal = Animal.last
      expect(animal.name).to eq("animal 1")
    end
  end

  def json
    JSON.parse(response.body)
  end
end
