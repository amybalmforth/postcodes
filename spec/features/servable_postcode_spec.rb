feature 'servable postcode' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content('postcodes.')
  end

  scenario 'entering a servable postcode' do
    visit('/')
    fill_in 'my_postcode', with: 'SE17QD'
    click_button('go')
    expect(page).to have_content('This postcode is servable')
  end
end
