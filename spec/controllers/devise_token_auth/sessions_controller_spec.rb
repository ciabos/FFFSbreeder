describe DeviseTokenAuth::SessionsController, type: :request do
  describe "#create" do
    it "signs in breeder" do
      breeder = create(:breeder)
      params = {
        email: breeder.email,
        password: "password"
      }

      expect(breeder.tokens.size).to eq(0)

      post "/api/v1/breeder_auth/sign_in", params: params

      expect(breeder.reload.tokens.size).to eq(1)
      expect(response.status).to eq(200)
    end
  end

  describe "#destroy" do
    it "removes breeder" do
      breeder = create(:breeder)
      auth_headers  = breeder.create_new_auth_token

      expect(breeder.tokens.size).to eq(1)

      delete "/api/v1/breeder_auth/sign_out", params: {}, headers: auth_headers

      expect(breeder.reload.tokens.size).to eq(0)
      expect(response.status).to eq(200)
    end
  end
end
