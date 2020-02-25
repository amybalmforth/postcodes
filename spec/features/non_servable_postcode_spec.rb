feature 'non servable postcode' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content('Postcode service area check')
  end

  scenario 'entering a non servable postcode' do
    visit('/')
    fill_in 'my_postcode', with: 'CR04FT'
    click_button('go')
    expect(page).to have_content('This postcode is not servable')
  end
end
