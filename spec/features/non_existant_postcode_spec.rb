feature 'non existant postcode' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content('postcodes.')
  end

  scenario 'entering a non existant postcode' do
    visit('/')
    fill_in 'my_postcode', with: 'none'
    click_button('go')
    expect(page).to have_content('Invalid postcode')
  end
end
