require_relative '../lib/depute_scrapping'


describe "Depute Scrapping should scrap data from a website of the Assemblée Nationale" do
    it "should return a array with the names of deputés" do
      expect(get_firstnames).not_to be_nil
    end
  end

  describe "Depute Scrapping should scrap data from a website of the Assemblée Nationale" do 
    it "should return a value BTC.. else the program don't work. Long life for BTC" do
    expect(search_href).to include("/deputes/fiche/OMC_PA719866")
        end 
    end