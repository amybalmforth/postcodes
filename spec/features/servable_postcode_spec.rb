feature 'servable postcode' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content('postcodes.')
  end
end
