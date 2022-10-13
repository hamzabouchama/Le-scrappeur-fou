require_relative '../lib/00_dark-trader'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

describe "cryptomonaies functions" do
    describe "#crypto_value" do 
    it "equal to 20" do
        expect(crypto_value(page).length).to eq(20)
        end
    end
    
    describe "#crypto_name" do
    it "should be equal to BTC" do
        expect(crypto_name(page)[0]).to eq("BTC")
        end
    end

    describe "#crypto_name" do
    it "should be equal to USDT" do
        expect(crypto_name(page)[2]).to eq("USDT")
        end
    end
end