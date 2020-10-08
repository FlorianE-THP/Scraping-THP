require_relative '../lib/mairie_scrap'


describe "Mairie Scrap should scrap data from a website of departement" do
    it "should return a hash with multiples city's" do
      expect(search_email(search_ville)).not_to be_nil
    end
  end
  
  describe "Mairie Scrap should scrap data from a website of departement" do 
    it "should return a value Ableiges.. it's a city in Val d'oise in France" do
    expect(search_ville).to include("ableiges")
        end 
    end