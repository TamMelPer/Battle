feature 'Testing player registration' do
  scenario 'players will names in a form, submit form and see names on screen' do
    visit('/')
    fill_in :name1, with: 'Mel'
    fill_in :name2, with: 'Lucy'
    click_button 'Submit'
    expect(page).to have_content 'Mel vs. Lucy'
  end
end
