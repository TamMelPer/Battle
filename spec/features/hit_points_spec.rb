feature 'View hit points' do
  scenario 'see Player 2 hit points' do
    visit('/')
    fill_in :name1, with: 'Mel'
    fill_in :name2, with: 'Lucy'
    click_button 'Submit'
    expect(page).to have_content 'Lucy: 60HP'
  end
end
