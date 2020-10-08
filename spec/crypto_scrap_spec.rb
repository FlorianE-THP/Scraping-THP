require_relative '../lib/crypto_scrap'


describe "Crypto Scrap should scrap data from a website" do
    it "should return a hash with the name of crypto and the value" do
      expect(perform).not_to be_nil
    end
  end

  describe "Crypto Scrap should scrap data from a website" do 
    it "should return a value BTC.. else the program don't work. Long life for BTC" do
    expect(perform).to include("BTC")
        end 
    end