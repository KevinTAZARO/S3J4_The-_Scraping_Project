require_relative '../lib/crypto.rb'

describe "it should gather all cryptomoney into a hash" do
  it "return hash" do
    expect(crypto_collect).to be_an(Array)
  end

  #test2 vérifier la présence de x crypto
  it "return the name of a crypto" do
    expect(crypto_collect).to include{"BTC"}
    expect(crypto_collect).to include{"Avalanche"}
    expect(crypto_collect).to include{"TRON"}
  end
  
  #test3 vérifier que l'array contient 20 crypto
  it "return at least 20 crypto" do
    expect(crypto_collect.length).to eq(20)
  end
end