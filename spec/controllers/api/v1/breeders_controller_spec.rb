include ActionController::RespondWith

describe Api::V1::BreedersController, type: :request do
  describe "#index" do
    it "returns all breeders with their litters and animals" do
      breeder = create(:breeder)
      breeder_1 = create(:breeder)
      breeder_2 = create(:breeder)
      litter_1 = create(:litter, breeder: breeder_1)
      litter_2 = create(:litter, breeder: breeder_2)
      create_list(:animal, 2, litter: litter_1)
      create_list(:animal, 3, litter: litter_2)

      auth_headers = breeder.create_new_auth_token
      get "/api/v1/breeders", headers: auth_headers

      expect(json["data"][0]["attributes"]["name"]).to eq(breeder_1.name)
      expect(json["data"][1]["attributes"]["name"]).to eq(breeder_2.name)

      expect(json["data"][0]["relationships"]).to include("litters", "animals")
      expect(json["data"][1]["relationships"]).to include("litters", "animals")
      expect(json["included"].size).to eq 7
      # 7 =  litter_1, 2 animals in litter_1, litter_2, 3 animals in litter_2
    end
  end

  describe "#show" do
    it "returns breeder and his/hers litters with animals" do
      breeder = create(:breeder)
      litter = create(:litter, breeder: breeder)
      create_list(:animal, 2, litter: litter)

      auth_headers = breeder.create_new_auth_token
      get "/api/v1/breeders/#{breeder.id}", headers: auth_headers

      expect(json["data"]["attributes"]["name"]).to eq(breeder.name)
      expect(json["data"]["attributes"]["rattery-name"]).to eq(breeder.rattery_name)
      expect(json["data"]["relationships"]).to include("litters", "animals")
      expect(json["included"].size).to eq 3
    end
  end

  def json
    JSON.parse(response.body)
  end
end
