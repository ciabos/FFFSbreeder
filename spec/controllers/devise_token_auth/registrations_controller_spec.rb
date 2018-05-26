describe DeviseTokenAuth::RegistrationsController, type: :request do
  describe "#create" do
    it "creates breeder" do
      params = {
        name: "Breeder Guy",
        email: "breeder@example.com",
        password: "password",
        password_confirmation: "password",
        rattery_name: "Rattery Test",
        confirm_success_url: "http://example.com"
      }

      expect { post "/api/v1/breeder_auth", params: params }.to change(
        Breeder, :count
      ).by(1)

      expect(response.status).to eq(200)
      breeder = Breeder.last
      expect(breeder.name).to eq("Breeder Guy")
      expect(breeder.email).to eq("breeder@example.com")
      expect(breeder.rattery_name).to eq("Rattery Test")
    end
  end

  describe "#update" do
    it "updates breeder" do
      breeder = create(:breeder)
      auth_headers  = breeder.create_new_auth_token
      update_params = {
        name: "New changed name",
        rattery_name: "New rattery name"
      }

      patch "/api/v1/breeder_auth", params: update_params, headers: auth_headers

      breeder.reload
      expect(breeder.name).to eq("New changed name")
      expect(breeder.rattery_name).to eq("New rattery name")
    end
  end

  describe "#destroy" do
    it "removes breeder" do
      breeder = create(:breeder)
      auth_headers  = breeder.create_new_auth_token

      expect {
        delete "/api/v1/breeder_auth", params: {}, headers: auth_headers
      }.to change(Breeder, :count).by(-1)

      expect(Breeder.last).to eq(nil)
    end
  end
end
