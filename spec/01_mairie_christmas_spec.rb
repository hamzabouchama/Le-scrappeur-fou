require_relative '../lib/01_mairie_christmas'

describe 'we are getting the right mail for the right town' do
  it 'vérifies that town' do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/ableiges.html")).to eq("mairie.ableiges95@wanadoo.fr")
  end
end

describe 'we are getting the right url' do
  it 'vérifies that' do
    expect(get_townhall_urls.include?("./95/frouville.html")).to eq(TRUE)
  end
end

describe 'we are getting the right name' do
  it 'vérifies that' do
    expect(get_townhall_name.include?("FROUVILLE")).to eq(TRUE)
  end
end